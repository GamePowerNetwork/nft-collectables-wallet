import { GENERATE_PHRASE } from '../types'


const initialState = {
  phrase: undefined
}

export function keyringReducer(state = initialState, action) {
  switch (action.type) {
    case GENERATE_PHRASE: {
      return {
        ...state,
        phrase: action.payload
      }
    }
    default:
      return state
  }
}