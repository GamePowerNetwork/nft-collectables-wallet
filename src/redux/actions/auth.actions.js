import { 
  APPLE_LOGIN,
  APPLE_LOGIN_SUCCESS,
  FACEBOOK_LOGIN, 
  FACEBOOK_LOGIN_SUCCESS, 
  GOOGLE_LOGIN, 
  GOOGLE_LOGIN_SUCCESS 
} from '../types';


export const fbLogin = () => {
  return { type: FACEBOOK_LOGIN }
}

export const fbLoginSuccess = (payload) => {
  return {
    type: FACEBOOK_LOGIN_SUCCESS,
    payload
  }
}

export const googleLogin = () => {
  return { type: GOOGLE_LOGIN }
}

export const googleLoginSuccess = (payload) => {
  return {
    type: GOOGLE_LOGIN_SUCCESS,
    payload
  }
}

export const appleLogin = () => {
  return { type: APPLE_LOGIN }
}

export const appleLoginSuccess = (payload) => {
  return {
    type: APPLE_LOGIN_SUCCESS,
    payload
  }
}
