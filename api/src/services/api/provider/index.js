import { ApiPromise, WsProvider } from '@polkadot/api';

export default {
    connect: async (endpoint) => {
        const wsProvider = new WsProvider(`wss://${endpoint}`);
        const connection = await ApiPromise.create({ 
        provider: wsProvider,
        
        types: {
            "CID": "Vec<u8>",
            "GuildId": "u64",
            "GuildOf": "Guild<AccountIdOf>",
            "AccountIdOf": "AccountId",
            "BalanceOf": "Balance",
            "ClassId": "u64",
            "ClassIdOf": "ClassId",
            "ClassInfoOf": "ClassInfo",
            "ClassInfo": {
            "metadata": "Vec<u8>",
            "total_issuance": "TokenId",
            "owner": "AccountId",
            "data": "ClassData"
            },
            "ClassData": {
            "deposit": "Balance",
            "properties": "ClassProperties"
            },
            "TokenId": "u64",
            "Amount": "i128",
            "AmountOf": "Amount",
            "CurrencyIdOf": "CurrencyId",
            "CurrencyId": {
            "_enum": [
                "Native",
                "DOT",
                "KSM",
                "AP"
            ]
            },
            "Guild": {
            "id": "GuildId",
            "name": "Text",
            "members": "Vec<AccountId>"
            },
            "GuildUpdate": {
            "members": "Vec<AccountId>",
            "name": "Text"
            },
            "ClassProperties": {
            "Transferrable": "bool",
            "Burnable": "bool"
            }
        }
        });

        return connection;
    },
}