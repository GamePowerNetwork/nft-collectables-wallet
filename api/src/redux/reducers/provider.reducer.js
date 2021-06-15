import { CONNECT_PROVIDER_SUCCESS } from '../types';


const initialState = {
  connection: {
    connection: null,
    provider: null
  }
};

export function providerReducer(state = initialState, action) {
  switch (action.type) {
    case CONNECT_PROVIDER_SUCCESS: {
      return {
        ...state,
        connection: action.payload
      }
    }
    default:
      return state
  }
};