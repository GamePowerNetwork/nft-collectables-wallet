import { PHRASE_REQUEST } from '../types';


const initialState = {
  request: undefined
};

export function apiReducer(state = initialState, action) {
  switch (action.type) {
    case PHRASE_REQUEST: {
      return {
        ...state,
        request: action.payload
      }
    }
    default:
      return state
  }
};