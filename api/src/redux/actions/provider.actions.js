import { CONNECT_PROVIDER_SUCCESS } from "../types"

export const connectProviderSuccess = (connection) => {
  return { type: CONNECT_PROVIDER_SUCCESS, payload: connection }
}