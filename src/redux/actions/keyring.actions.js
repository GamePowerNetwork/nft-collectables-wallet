import { GENERATE_PHRASE, GENERATE_PHRASE_SUCCESS } from '../types';


export const generatePhraseSuccess = (phrase) => {
  return { type: GENERATE_PHRASE_SUCCESS, payload: phrase }
}

export const generatePhrase = () => {
  return { type: GENERATE_PHRASE }
}
