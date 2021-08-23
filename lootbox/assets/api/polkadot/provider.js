let provider;

export async function connect() {
  const wsProvider = new api.WsProvider('ws://127.0.0.1:9944');
  provider = await api.ApiPromise.create({provider: wsProvider});

  let count = 0;
  const unsub = await provider.rpc.chain.subscribeNewHeads((header) => {
    console.log(`#${header.number}:`, header);

    if (++count === 5) {
      console.log('5 headers retrieved, unsubscribing');
      unsub();
    }
  });

  return {
    genesis: provider.genesisHash.toHex()
  }
}