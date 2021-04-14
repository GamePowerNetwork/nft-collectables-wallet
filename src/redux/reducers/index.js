import { combineReducers } from 'redux';
import { keyringReducer } from './keyring.reducer';
import { apiReducer } from './api.reducer'

export default combineReducers({
    apiReducer,
    keyringReducer,
})