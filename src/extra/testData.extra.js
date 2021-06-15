const phraseData = {
    phrase: "lion october thank mom level patch angry clarify glow kid dry caution"
}

const seriesData = [
    {id:"1", count:2, name:"This is a really long name", image:"https://images.unsplash.com/photo-1618386230353-3631c1365be2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80"},
    {id:"2", count:2, name:"Ladies Series", image:"https://images.unsplash.com/photo-1618510050510-d0903984e131?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80"},
    {id:"3", count:321, name:"Space Series", image:"https://images.unsplash.com/photo-1581822261290-991b38693d1b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"},
    {id:"4", count:2, name:"skull", image:"https://images.unsplash.com/photo-1618449625138-62cb2b8a343a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80"},
    {id:"5", count:2, name:"hero", image:"https://images.unsplash.com/photo-1618513847270-992347f2c59c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1567&q=80"}
]


const collectibleData = [
    {id:"1", name:"dragon", image:"https://images.unsplash.com/photo-1610926597998-fc7f2c1b89b0?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80"},
    {id:"2", name:"bird", image:"https://images.unsplash.com/photo-1591198936750-16d8e15edb9e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80"},
    {id:"3", name:"pony", image:"https://images.unsplash.com/photo-1613043399165-d6ae7327ae02?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1567&q=80"},
    {id:"4", name:"skull", image:"https://images.unsplash.com/photo-1545062990-4a95e8e4b96d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80"},
    {id:"5", name:"hero", image:"https://images.unsplash.com/photo-1501432377862-3d0432b87a14?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80"}
]

const scanData = {
    c: 0, //chain
    p: 'gamepower', //provider
    n: '25', //nft id
}
/*
/ QR URI Format
/ c = chain
// 0 = substrate
// 1 = moonbeam
// 2 = acala
// 3 = ethereum
// 4 = polygon
// 5 = solana
/ p = provider (only for c0)
/ n = NFT ID / Contract
*/
//nero:claim;c:0;p:gamepower;n:25
//https://ipfs.io/ipfs/QmTVVFiJztv5Qkp5nfYLNBwnbX3fcPjHEriP9wbuMHr3MR?filename=provider.json

const nftData = {
    collection: '0ahhadf874a77b-APPL',
    name: 'Golden Skull',
    instance: 'Dragon_0ahhadf874a77b-APPL',
    transferable: 1,
    sn: '00000000001',
    metadata: {
        title: 'Golden Skull',
        name: 'Golden Skull',
        type: 'object',
        external_link: 'https://lootbox.gamepower.network/',
        image: 'https://images.unsplash.com/photo-1545062990-4a95e8e4b96d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80', //350 x 350
        description: "A photo of an apple",
        attributes: [
            {
                trait_type: "Creator",
                value: "GamePower"
            },
            {
                trait: "health",
                value: 20
            }
        ],
        properties: {
            name: {
                type: "string",
                description: "Apple"
            },
            description: {
                type: "string",
                description: "Just an Apple"
            },
            preview_media_file: {
                type: "string",
                description: "https://ipfsgateway.makersplace.com/ipfs/QmZ15eQX8FPjfrtdX3QYbrhZxJpbLpvDpsgb2p3VEH8Bqq"
            },
            preview_media_file_type: {
                type: "string",
                description: "jpg"
            },
            created_at: {
                type: "datetime",
                description: "2021-02-16T00:07:31.674688+00:00"
            },
            total_supply: {
                type: "int",
                description: 1
            },
            raw_media_file: {
                type: "string",
                description: "https://ipfsgateway.makersplace.com/ipfs/QmZ15eQX8FPjfrtdX3QYbrhZxJpbLpvDpsgb2p3VEH8Bqq"
            }
        }
    },
    data: {
        "protocol": "https",
        "data": "http://image-goes-here.jpg",
        "type": "image/png"
    }
}

const userData = {
    "apiKey": "AIzaSyADkf-0C86lLa6b1wxcShYhiSpdNLO5Y9w",
    "appName": "[DEFAULT]",
    "authDomain": "lootbox-wallet.firebaseapp.com",
    "createdAt": "1619416950630",
    "displayName": null,
    "email": "mv9btxyc2n@privaterelay.appleid.com",
    "emailVerified": true,
    "isAnonymous": false,
    "lastLoginAt": "1619729187609",
    "multiFactor": {
        "enrolledFactors": [],
    },
    "phoneNumber": null,
    "photoURL": null,
    "providerData": [
        {
            "displayName": null,
            "email": "mv9btxyc2n@privaterelay.appleid.com",
            "phoneNumber": null,
            "photoURL": null,
            "providerId": "apple.com",
            "uid": "001630.c5f65243e6234b34b258b35ecb8a8c1f.0029",
        },
    ],
    "redirectEventId": null,
    "stsTokenManager": {
        "accessToken": "eyJhbGciOiJSUzI1NiIsImtpZCI6IjRlOWRmNWE0ZjI4YWQwMjUwNjRkNjY1NTNiY2I5YjMzOTY4NWVmOTQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vbG9vdGJveC13YWxsZXQiLCJhdWQiOiJsb290Ym94LXdhbGxldCIsImF1dGhfdGltZSI6MTYxOTcyOTE4NywidXNlcl9pZCI6IkJ0bFRNOGl3Vm5PSHRlM3BpVk05aWFDRjlRYjIiLCJzdWIiOiJCdGxUTThpd1ZuT0h0ZTNwaVZNOWlhQ0Y5UWIyIiwiaWF0IjoxNjE5NzI5MTg3LCJleHAiOjE2MTk3MzI3ODcsImVtYWlsIjoibXY5YnR4eWMybkBwcml2YXRlcmVsYXkuYXBwbGVpZC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJhcHBsZS5jb20iOlsiMDAxNjMwLmM1ZjY1MjQzZTYyMzRiMzRiMjU4YjM1ZWNiOGE4YzFmLjAwMjkiXSwiZW1haWwiOlsibXY5YnR4eWMybkBwcml2YXRlcmVsYXkuYXBwbGVpZC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJhcHBsZS5jb20ifX0.n_Yiw45_2oCnBIWW92uw14S5ZXvrdlTmrQt4Q_ZOeZDfhAnSP3pkKEqMfxFQ-2arLkn34q-AYNO0dw4X1N5-gC21uwQnhkAY4uIaABtktKp1dDwtRKvDuTWR1YGROOBSKmm6wUPSvcrBm485tt2VxZaJhb0mEhAeJLeOQAqJEmIajbuqhOUNmPXjcVr0p73iA1j1UwXUmKiGcswQPwLuG4DQHZ2lTSzqRlN1TBcfo_LBnL2gUdji-zL6IfHHAUy9Rucrj0LBxfFmKWHUfrnvxQtsq-IYGW0_XchWYYFDpzR7tD5NhjQxaesbdNQ5VXNM4aP1HboMauTcVu8MdoVlxQ",
        "apiKey": "AIzaSyADkf-0C86lLa6b1wxcShYhiSpdNLO5Y9w",
        "expirationTime": 1619732787662,
        "refreshToken": "AGEhc0B6fI29Z8nYcwEyUG1kIrac-eefMWA5_PpDgZJeU2rNSh6A5u6jIWPFfMw5Xzt1hje9lVxJRo2DgejKa-1o62c6u62SOBXvZwav9C57uRPb-oErxDwUfY1v0oWJILw9ZvF3nibNQDpuO2Kkmk6dnKM2IDPkWuVke3x3UGHWhhfBp7kwOAgvB6d4MWRNGFe_4xb8V4JzzehGhk-Se9sNCi_qqEL02S01Zy257j3VR7qRBCIriASG8JPRkTsaBUxjKCf5t590piCZUx_0Ovf9K8-4KZ6QEe-YZxlZTT7vCg4lWxuJK42hh5d3NpCdDDTLfY6Iuzeq",
    },
    "tenantId": null,
    "uid": "BtlTM8iwVnOHte3piVM9iaCF9Qb2",
}

export const testData = {
    phraseData,
    collectibleData,
    nftData,
    scanData,
    seriesData,
    userData
}