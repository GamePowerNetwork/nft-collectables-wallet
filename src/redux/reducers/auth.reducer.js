import { 
  LOGIN_SUCCESS, 
  LOGIN_FAILURE,
  LOGOUT
 } from '../types';


const initialState = {
  token: null,
  user: null,
  error: null
};

export function authReducer(state = initialState, action) {
  switch (action.type) {
    case LOGIN_SUCCESS: {
      return {
        ...state,
        token: action.payload.token,
        user: action.payload.user
      }
    }
    case LOGIN_FAILURE: {
      return {
        ...state,
        error: action.error
      }
    }
    case LOGOUT: {
      return {
        ...state,
        token: null,
        user: null
      }
    }
    default:
      return state
  }
};