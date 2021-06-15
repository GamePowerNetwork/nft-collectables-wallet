import * as types from "../types"
import * as actions from "../actions"

const facebookLoginFlow = ({api}) => ({dispatch}) => next => async (action) => {

    next(action)

    if (action.type === types.FACEBOOK_LOGIN) {
        try {
          api.auth.fbLogin()
        } catch (error) {
          dispatch(actions.loginFailure(error));
        }
    }
}

const googleLoginFlow = ({api}) => ({dispatch}) => next => async (action) => {

  next(action)

  if (action.type === types.GOOGLE_LOGIN) {
      try {
        api.auth.googleLogin()
      } catch (error) {
        dispatch(actions.loginFailure(error));
      }
  }
}

const appleLoginFlow = ({api}) => ({dispatch}) => next => async (action) => {

  next(action)

  if (action.type === types.APPLE_LOGIN) {
      try {
        api.auth.appleLogin()
      } catch (error) {
        dispatch(actions.loginFailure(error));
      }
  }
}

const logoutFlow = ({api}) => ({dispatch}) => next => async (action) => {

  next(action)

  if (action.type === types.LOGOUT) {
      try {
        api.auth.logout()
      } catch (error) {
        //dispatch(actions.loginFailure(error));
      }
  }
}

export default [
    appleLoginFlow,
    facebookLoginFlow,
    googleLoginFlow,
    logoutFlow
]