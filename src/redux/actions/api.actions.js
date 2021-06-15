import { API_REQUEST, API_RESULT } from "../types"


export const apiResult = (result) => {
  return { type: API_RESULT, payload: result };
}
export const apiRequest = (action) => {
    return { type: API_REQUEST, payload: action };
}