import { GENERATE_PHRASE, GENERATE_PHRASE_SUCCESS } from '../types';


const initialState = {
  phrase: null
};

export function keyringReducer(state = initialState, action) {
  switch (action.type) {
    case GENERATE_PHRASE_SUCCESS: {
      return {
        ...state,
        phrase: action.payload
      }
    }
    default:
      return state
  }
};