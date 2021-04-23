import * as types from "../types"
import * as actions from "../actions"

const addProviderFlow = ({api}) => ({getState, dispatch}) => next => async (action) => {

    next(action);

    if (action.type === types.ADD_PROVIDER) {
        try {
          await api.provider.addProvider()
          dispatch(actions.addProviderSuccess({}))
        } catch (error) {
          dispatch(actions.addProviderFailure(error))
        }
    }
}

export default [
  addProviderFlow,
]