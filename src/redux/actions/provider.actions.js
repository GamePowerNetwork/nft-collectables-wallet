import { 
  ADD_PROVIDER, 
  ADD_PROVIDER_SUCCESS, 
  ADD_PROVIDER_FAILURE,
  CONNECT_PROVIDER,
  CONNECT_PROVIDER_SUCCESS,
  CONNECT_PROVIDER_FAILURE,
  GET_PROVIDER,
  GET_PROVIDER_SUCCESS,
  GET_PROVIDER_FAILURE 
} from '../types';


// Adding Provider
export const addProvider = () => {
  return { type: ADD_PROVIDER }
}

export const addProviderSuccess = (provider) => {
  return { type: ADD_PROVIDER_SUCCESS, payload: provider }
}

export const addProviderFailure = (error) => {
  return { type: ADD_PROVIDER_FAILURE, payload: error }
}

// Get Provider
export const getProvider = () => {
  return { type: GET_PROVIDER }
}

export const getProviderSuccess = (provider) => {
  return { type: GET_PROVIDER_SUCCESS, payload: provider }
}

export const getProviderFailure = (error) => {
  return { type: GET_PROVIDER_FAILURE, payload: error }
}

// Connect Provider
export const connectProvider = (provider) => {
  return { type: CONNECT_PROVIDER, payload: provider }
}

export const connectProviderSuccess = (provider) => {
  return { type: CONNECT_PROVIDER_SUCCESS, payload: provider }
}

export const connectProviderFailure = (error) => {
  return { type: CONNECT_PROVIDER_FAILURE, payload: error }
}