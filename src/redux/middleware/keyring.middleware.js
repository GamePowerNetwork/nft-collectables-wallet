import * as types from "../types"
import * as actions from "../actions"

const generatePhraseFlow = ({api}) => ({getState, dispatch}) => next => async (action) => {

    next(action);

    if (action.type === types.GENERATE_PHRASE) {
        try {
          dispatch(actions.phraseRequest({type: types.GENERATE_PHRASE}))
        } catch (error) {
          console.log(error)
        }
    }
}

export default [
    generatePhraseFlow,
]