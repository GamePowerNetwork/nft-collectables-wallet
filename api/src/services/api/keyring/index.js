import { mnemonicGenerate } from '@polkadot/util-crypto';


export default {
    generatePhrase: () => {
        // generate a random mnemonic, 12 words in length
        const mnemonic = mnemonicGenerate(12);
        return mnemonic;
    }
}