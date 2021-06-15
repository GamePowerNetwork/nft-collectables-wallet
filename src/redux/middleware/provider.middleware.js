import * as types from "../types"
import * as actions from "../actions"
import { CONNECT_PROVIDER } from "../types";

const addProviderFlow = ({api}) => ({dispatch}) => next => async (action) => {

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

const connectProviderFlow = () => ({getState, dispatch}) => next => async (action) => {

  next(action);

  if (action.type === types.CONNECT_PROVIDER) {
      try {
        // check if we have an active connection to the provider
        const { provider } = getState().providerReducer.connection;

        // if we don't have a connection, let's connect
        dispatch(actions.apiRequest({type: CONNECT_PROVIDER, payload: action.payload}))
      } catch (error) {
        dispatch(actions.connectProviderFailure(error))
      }
  }
}

const connectProviderSuccessFlow = () => ({dispatch}) => next => async (action) => {

  next(action);

  if (action.type === types.CONNECT_PROVIDER_SUCCESS) {
      try {
        //TODO: update UI to show connected to provider
        //console.log("app:CONNECT PROVIDER SUCCESS: ", action.payload.provider)
      } catch (error) {
        dispatch(actions.connectProviderFailure(error))
      }
  }
}

export default [
  addProviderFlow,
  connectProviderFlow,
  connectProviderSuccessFlow
]