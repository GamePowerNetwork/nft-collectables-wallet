import { compose, applyMiddleware, createStore } from "redux";
import reducers from './reducers';
import middleware from './middleware';


// dev tool
const composeEnhancers = compose;


export const configureStore = (services) => createStore(
    reducers, 
    composeEnhancers(applyMiddleware(...middleware.map(f => f(services))))
);