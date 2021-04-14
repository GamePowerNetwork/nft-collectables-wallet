import { entropyToMnemonic } from '@react-native-cryptocurrencies/bip39'
import * as Random from 'expo-random'

const STRENGTH_MAP = {
  12: 16 * 8,
  15: 20 * 8,
  18: 24 * 8,
  21: 28 * 8,
  24: 32 * 8
}

/**
 * Generate random bytes
 *
 * @param {Number} length
 * @returns {Buffer} Random bytes
 */
const randomAsU8a = (length = 32) =>
  new Promise((resolve, reject) => {
    resolve(Random.getRandomBytes(length))
  })

/**
 * Use bip39 to generate mnemonic words
 *
 * @param {Number} words length
 * @returns {String} Mnemonic words
 */
const mnemonicGenerate = async (words = 12) => {
  const strength = STRENGTH_MAP[words]
  const entropy = await randomAsU8a(strength / 8)

  entropyToMnemonic(entropy).then(phrase => {
    console.log(phrase)
  })
}

export { mnemonicGenerate, randomAsU8a }