import { 
  ADD_PROVIDER, 
  ADD_PROVIDER_SUCCESS, 
  CONNECT_PROVIDER, 
  CONNECT_PROVIDER_SUCCESS,
  CONNECT_PROVIDER_FAILURE
} from '../types';


const initialState = {
  providers: [],
  connection: {
    provider: null,
    connection: null,
    isConnecting: false
  }
};

export function providerReducer(state = initialState, action) {
  switch (action.type) {
    case ADD_PROVIDER_SUCCESS: {
      return {
        ...state,
        providers: [ ...state.providers, action.payload]
      }
    }

    case CONNECT_PROVIDER: {
      return {
        ...state,
        connection: {
          ...state.connection,
          isConnecting: true
        }
      }
    }

    case CONNECT_PROVIDER_SUCCESS: {
      return {
        ...state,
        connection: {
          provider: action.payload.provider,
          connection: action.payload.connection,
          isConnecting: false
        }
      }
    }

    case CONNECT_PROVIDER_FAILURE: {
      return {
        ...state,
        connection: {
          provider: null,
          connection: null,
          isConnecting: false
        }
      }
    }
    default:
      return state
  }
};