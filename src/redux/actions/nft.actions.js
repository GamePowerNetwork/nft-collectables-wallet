import {
  CLAIM_NFT,
  CLAIM_NFT_SUCCESS,
  CLAIM_NFT_FAILURE,
  CLAIM_PENDING_NFT,
  FETCH_COLLECTIBLES, 
  FETCH_COLLECTIBLES_FAILURE, 
  FETCH_COLLECTIBLES_SUCCESS, 
  FETCH_SERIES, 
  FETCH_SERIES_SUCCESS, 
  FETCH_SERIES_FAILURE 
} from "../types"

// Collectibles
export const fetchCollectibles = () => {
    return { type: FETCH_COLLECTIBLES };
}
export const fetchCollectiblesSuccess = (results) => {
  return { type: FETCH_COLLECTIBLES_SUCCESS, payload: results };
}
export const fetchCollectiblesFailure = (error) => {
    return { type: FETCH_COLLECTIBLES_FAILURE, payload: error };
}

// Series
export const fetchSeries = () => {
  return { type: FETCH_SERIES };
}
export const fetchSeriesSuccess = (results) => {
return { type: FETCH_SERIES_SUCCESS, payload: results };
}
export const fetchSeriesFailure = (error) => {
  return { type: FETCH_SERIES_FAILURE, payload: error };
}

// Claim
export const claimNFT = (claimData, isPending = false) => {
  return { type: CLAIM_NFT, payload: claimData, isPending};
}
export const claimNFTSuccess = (results) => {
return { type: CLAIM_NFT_SUCCESS, payload: results };
}
export const claimNFTFailure = (error) => {
  return { type: CLAIM_NFT_FAILURE, payload: error };
}
export const claimPendingNFT = () => {
  return { type: CLAIM_PENDING_NFT }
}