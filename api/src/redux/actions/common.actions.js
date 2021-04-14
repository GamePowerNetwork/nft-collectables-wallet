import { FETCH_REQUEST, FETCH_FAILURE, SEND_RESULTS } from "../types"

export const request = () => {
  return { type: FETCH_REQUEST }
}

export const failure = (error) => {
  return { type: FETCH_FAILURE, payload: error }
}

export const sendResults = (result) => {
  return { type: SEND_RESULTS, payload: result }
}