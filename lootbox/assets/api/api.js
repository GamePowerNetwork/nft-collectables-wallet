import * as Keyring from './polkadot/keyring.js';

window.Keyring = Keyring;

function apiInit() {
    window.send(Keyring.getPhrase());
}

function request(name, json) {
    let message = JSON.parse(json);
    let result = window[name][message.method]();

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