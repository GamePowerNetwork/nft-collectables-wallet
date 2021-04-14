import { FETCH_REQUEST, FETCH_FAILURE } from "../types"

export const request = () => {
    return { type: FETCH_REQUEST };
}
export const failure = (error) => {
    return { type: FETCH_FAILURE, payload: error };
}