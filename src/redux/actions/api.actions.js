import { PHRASE_REQUEST, PHRASE_RESULT } from "../types"

export const phraseResult = (phrase) => {
  return { type: PHRASE_RESULT, payload: phrase };
}
export const phraseRequest = (action) => {
    return { type: PHRASE_REQUEST, payload: action };
}