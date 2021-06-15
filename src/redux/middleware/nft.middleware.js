import * as types from "../types"
import * as actions from "../actions"
import { CLAIM_NFT } from "../types";

const claimNFTFlow = ({api}) => ({getState, dispatch}) => next => async (action) => {

  next(action);

  if (action.type === types.CLAIM_NFT) {
      try {
        let claim = action.payload;

        if(!action.isPending) {
          // Parse claim data
          claim = api.nft.getClaimData(action.payload)
        }

        // Connect to provider if it currently isn't active
        // check if we have an active connection to the provider
        const { provider } = getState().providerReducer.connection;
        if(provider && claim.provider.id === provider.id) {
          //Production: dispatch(actions.apiRequest({type: CLAIM_NFT, payload: claim}))
          //Testing:
          const nft = await api.nft.claimNFT()
          dispatch(actions.claimNFTSuccess(nft))
        } else {
          // Need to connect, add NFT to pending
          getState().nftReducer.pendingClaims.push(claim)
          // connect to provider
          dispatch(actions.connectProvider(claim.provider))
        }
      } catch (error) {
        console.log(error)
      }
  }
}

const claimPendingNFTFlow = ({api}) => ({getState, dispatch}) => next => async (action) => {

  next(action);

  if (action.type === types.CLAIM_PENDING_NFT) {
      try {
        dispatch(actions.claimNFT(getState().nftReducer.pendingClaims.pop(), true))
      } catch (error) {
        console.log(error)
      }
  }
}

const fetchCollectiblesFlow = ({api}) => ({getState, dispatch}) => next => async (action) => {

    next(action);

    if (action.type === types.FETCH_COLLECTIBLES) {
        try {
          const results = await api.nft.getCollectibles();
          dispatch(actions.fetchCollectiblesSuccess(results))
        } catch (error) {
          console.log(error)
        }
    }
}

const fetchSeriesFlow = ({api}) => ({getState, dispatch}) => next => async (action) => {

  next(action);

  if (action.type === types.FETCH_SERIES) {
      try {
        const results = await api.nft.getSeries();
        dispatch(actions.fetchSeriesSuccess(results))
      } catch (error) {
        console.log(error)
      }
  }
}

export default [
    claimNFTFlow,
    claimPendingNFTFlow,
    fetchCollectiblesFlow,
    fetchSeriesFlow
]