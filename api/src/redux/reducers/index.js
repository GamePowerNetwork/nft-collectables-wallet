import { combineReducers } from 'redux'
import { keyringReducer } from './keyring.reducer'
import { providerReducer } from './provider.reducer'

export default combineReducers({
    keyringReducer,
    providerReducer
})