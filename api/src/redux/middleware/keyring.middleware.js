import * as types from "../types"
import * as actions from "../actions"

const generatePhraseFlow = ({api}) => ({getState, dispatch}) => next => async (action) => {

    next(action);

    if (action.type === types.GENERATE_PHRASE) {
        try {
          const response = api.keyring.generatePhrase()
          const result = {
            type: types.GENERATE_PHRASE_SUCCESS,
            payload: response
          }
          dispatch(actions.sendResults(result))
        } catch (error) {
          console.log(error, api)
        }
    }
}

export default [
    generatePhraseFlow,
]