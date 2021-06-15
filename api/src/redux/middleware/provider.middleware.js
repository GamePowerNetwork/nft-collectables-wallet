import * as types from "../types"
import * as actions from "../actions"

const connectProviderFlow = ({api}) => ({dispatch}) => next => async (action) => {
    next(action)

    if (action.type === types.CONNECT_PROVIDER) {
        try {
          const provider = action.payload
          const connection = await api.provider.connect(provider.endpoints[0])
          const result = {
            type: types.CONNECT_PROVIDER_SUCCESS,
            payload: {
              provider,
              connection
            }
          }
          dispatch(actions.connectProviderSuccess(result.payload))
          dispatch(actions.sendResults(result))
        } catch (error) {
            //dispatch(actions.connectProviderFailure(error));
        }
    }
}


export default [
    connectProviderFlow
]