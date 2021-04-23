import { FACEBOOK_LOGIN_SUCCESS, GOOGLE_LOGIN_SUCCESS, APPLE_LOGIN_SUCCESS } from '../types';


const initialState = {
  token: null,
  user: null
};

export function authReducer(state = initialState, action) {
  switch (action.type) {
    case FACEBOOK_LOGIN_SUCCESS: {
      return {
        ...state,
        token: action.payload.token,
        user: action.payload.user
      }
    }
    case GOOGLE_LOGIN_SUCCESS: {
      return {
        ...state,
        token: action.payload.token,
        user: action.payload.user
      }
    }
    case APPLE_LOGIN_SUCCESS: {
      return {
        ...state,
        token: action.payload.identityToken,
        user: {
          name: `${action.payload.fullName.givenName} ${action.payload.fullName.familyName}`
        }
      }
    }
    default:
      return state
  }
};