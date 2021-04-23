import * as types from "../types"
import * as actions from "../actions"

const claimNFTFlow = ({api}) => ({getState, dispatch}) => next => async (action) => {

  next(action);

  if (action.type === types.CLAIM_NFT) {
      try {
        const claim = api.nft.getClaimData(action.payload)
        // Add pending NFT
        getState().nftReducer.pendingClaims.push(claim)
        // Connect to provider
        //dispatch(actions.connectProvider(claim.provider))
        dispatch(actions.phraseRequest({type: types.GENERATE_PHRASE}))
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
    fetchCollectiblesFlow,
    fetchSeriesFlow
]