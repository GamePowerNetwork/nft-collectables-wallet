import keyring from './keyring.middleware'
import common from './common.middleware'
import nft from './nft.middleware'
import provider from './provider.middleware'

export default [
    ...keyring,
    ...common,
    ...nft,
    ...provider
]