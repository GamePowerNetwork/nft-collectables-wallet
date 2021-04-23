import { combineReducers } from 'redux'
import { keyringReducer } from './keyring.reducer'
import { apiReducer } from './api.reducer'
import { authReducer } from './auth.reducer'
import { nftReducer } from './nft.reducer'
import { providerReducer } from './provider.reducer'

export default combineReducers({
    apiReducer,
    authReducer,
    nftReducer,
    keyringReducer,
    providerReducer
})