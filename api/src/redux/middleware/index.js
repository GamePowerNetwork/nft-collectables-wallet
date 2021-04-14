import keyring from './keyring.middleware'
import common from './common.middleware'

export default [
    ...keyring,
    ...common
]