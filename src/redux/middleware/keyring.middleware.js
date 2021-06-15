import * as types from "../types"
import * as actions from "../actions"

const generatePhraseFlow = () => ({dispatch}) => next => async (action) => {

    next(action);

    if (action.type === types.GENERATE_PHRASE) {
        try {
          dispatch(actions.apiRequest({type: types.GENERATE_PHRASE}))
        } catch (error) {
          console.log(error)
        }
    }
}

export default [
    generatePhraseFlow,
]