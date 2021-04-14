import * as types from "../types"
import * as actions from "../actions"

const sendResults = ({api}) => ({getState, dispatch}) => next => async (action) => {

    next(action);

    if (action.type === types.SEND_RESULTS) {
        try {
          window.ReactNativeWebView.postMessage(JSON.stringify(action.payload));
        } catch (error) {
          console.log(error)
        }
    }
}

export default [
  sendResults,
]