export function getPhrase() {
    const phrase = util_crypto.mnemonicGenerate();
    return {phrase};
}

export async function createPair(args) {
    // Create keyring
    const appKeyring = new keyring.Keyring({type: 'sr25519', ss58Format: 42 });

    await util_crypto.cryptoWaitReady();

    const pair = appKeyring.createFromUri(args.phrase, {name: 'NeroVerseWallet'});

    // Create valid Substrate-compatible seed from mnemonic
    //const seed = util_crypto.mnemonicToMiniSecret(args.phrase);

    // Generate new public/secret keypair for the user from the supplied seed
    //const {publicKey, secretKey} = util_crypto.naclKeypairFromSeed(seed);

    return {
        name: pair.meta.name,
        address: pair.address,
        phrase: args.phrase,
    };
}