const {
    mnemonicGenerate
  } = require('@polkadot/util-crypto');

 var phrase = mnemonicGenerate(12)

 console.log(phrase)