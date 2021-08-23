import * as Keyring from './polkadot/keyring.js';
import * as Provider from './polkadot/provider.js';

window.Keyring = Keyring;
window.Provider = Provider;

function apiInit() {
    window.send(Keyring.getPhrase());
}

function request(name, json) {
    let message = JSON.parse(json);
    let result = window[name][message.method]((message.arguments) ? message.arguments : null);

    let response = {
        name,
        ...result,
    }
    send(JSON.stringify(response));
}

export {
    apiInit,
    request
}