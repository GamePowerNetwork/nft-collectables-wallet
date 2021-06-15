import { 
  CLAIM_PENDING_NFT,
  CLAIM_NFT_SUCCESS,
  FETCH_COLLECTIBLES_SUCCESS, 
  FETCH_COLLECTIBLES_FAILURE, 
  FETCH_SERIES_SUCCESS, 
  FETCH_SERIES_FAILURE } from '../types';


const initialState = {
  series: [],
  collectibles: [],
  pendingClaims: [],
  approvedClaim: null
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
    case CLAIM_NFT_SUCCESS: {
      return {
        ...state,
        approvedClaim: action.payload
      }
    }
    case CLAIM_PENDING_NFT: {
      return {
        ...state,
        pendingClaims: state.pendingClaims.splice(-1,1)
      }
    }
    default:
      return state
  }
};