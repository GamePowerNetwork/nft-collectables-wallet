import auth from './auth.middleware'
import nft from './nft.middleware'
import keyring from './keyring.middleware'
import provider from './provider.middleware'

export default [
    ...auth,
    ...nft,
    ...keyring,
    ...provider
]