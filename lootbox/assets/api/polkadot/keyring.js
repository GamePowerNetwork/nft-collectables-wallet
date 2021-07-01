export function getPhrase() {
    const phrase = util_crypto.mnemonicGenerate();
    return {phrase};
}