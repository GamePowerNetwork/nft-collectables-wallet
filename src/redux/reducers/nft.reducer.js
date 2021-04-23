import { FETCH_COLLECTIBLES_SUCCESS, FETCH_COLLECTIBLES_FAILURE, FETCH_SERIES_SUCCESS, FETCH_SERIES_FAILURE } from '../types';


const initialState = {
  series: [],
  collectibles: [],
  pendingClaims: []
};

export function nftReducer(state = initialState, action) {
  switch (action.type) {
    case FETCH_COLLECTIBLES_SUCCESS: {
      return {
        ...state,
        collectibles: action.payload
      }
    }
    case FETCH_SERIES_SUCCESS: {
      return {
        ...state,
        series: action.payload
      }
    }
    default:
      return state
  }
};