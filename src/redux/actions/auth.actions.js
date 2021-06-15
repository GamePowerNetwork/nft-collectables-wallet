import { 
  APPLE_LOGIN,
  FACEBOOK_LOGIN, 
  GOOGLE_LOGIN,
  LOGIN_SUCCESS,
  LOGIN_FAILURE,
  LOGOUT,
  TEST_LOGIN
} from '../types';

export const loginSuccess = (payload) => {
  return {
    type: LOGIN_SUCCESS,
    payload
  }
}

export const loginFailure = (error) => {
  return {
    type: LOGIN_FAILURE,
    error
  }
}

export const fbLogin = () => {
  return { type: FACEBOOK_LOGIN }
}

export const googleLogin = () => {
  return { type: GOOGLE_LOGIN }
}

export const appleLogin = () => {
  return { type: APPLE_LOGIN }
}

export const logout = () => {
  return { type: LOGOUT }
}