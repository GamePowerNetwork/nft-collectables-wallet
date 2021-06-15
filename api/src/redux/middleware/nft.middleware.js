import * as types from "../types"
import * as actions from "../actions"

const claimNFTFlow = ({api}) => ({getState, dispatch}) => next => async (action) => {
    next(action)

    if (action.type === types.CLAIM_NFT) {
        try {
          const {connection, provider} = await getState().providerReducer.connection

          //TODO: call the claim transaction

          // send the claim result
          const result = {
            type: types.CLAIM_NFT_SUCCESS,
            payload: {
              claim: action.payload
            }
          }
          dispatch(actions.sendResults(result))
        } catch (error) {
            //dispatch(actions.connectProviderFailure(error));
        }
    }
}


export default [
    claimNFTFlow
]