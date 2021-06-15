import firebase from "firebase/app";
import "firebase/auth";
import * as Crypto from "expo-crypto";
import * as Facebook from 'expo-facebook'
import * as Google from 'expo-google-app-auth'
import * as AppleAuthentication from 'expo-apple-authentication'
import {Alert} from 'react-native'

const GOOGLE_ANDROID_CLIENT_ID = "571002288984-kc2miucnquupq606p7qjcsch95vie0j9.apps.googleusercontent.com"
const GOOGLE_IOS_CLIENT_ID = "571002288984-t4tv9boccu8vhdpr8se7khrf1vctrq5b.apps.googleusercontent.com"

export default {
  fbLogin: async () => {
    try {
      //await Facebook.initializeAsync({appId: FACEBOOK_APP_ID})

      const { token, type } = await Facebook.logInWithReadPermissionsAsync(
        {
          permissions: ['public_profile', 'email']
        }
      )

      // Build Firebase credential with the Facebook access token.
      const credential = firebase.auth.FacebookAuthProvider.credential(token)

      await firebase
        .auth()
        .signInWithCredential(credential)

      //console.log(firebaseError);

      //return firebaseError;
      
      /*
      // GET USER DATA FROM FB API
      const response = await fetch(
        `https://graph.facebook.com/me?access_token=${token}`
      )
      const user = await response.json()
  
      // GET PROFILE IMAGE DATA FROM FB API
      // NOTE THAT I SET THE IMAGE WIDTH TO 500 WHICH IS OPTIONAL
      const pictureResponse = await fetch(
        `https://graph.facebook.com/v8.0/${user.id}/picture?width=500&redirect=false&access_token=${token}`
      )
      const pictureOBject = await pictureResponse.json()
      const userObject = {
        ...user,
        photoUrl: pictureOBject.data.url,
      }
  
      return { type, token, user: userObject }
      */

      return true
    } catch (e) {
      throw(e)
    }
  },

  googleLogin: async () => {
    try {
      const { type, idToken, accessToken, user } = await Google.logInAsync({
        androidStandaloneAppClientId: GOOGLE_ANDROID_CLIENT_ID,
        iosStandaloneAppClientId: GOOGLE_IOS_CLIENT_ID,
      })

      const credential = firebase.auth.GoogleAuthProvider.credential(idToken, accessToken)
  
      await firebase
        .auth()
        .signInWithCredential(credential)

      return true
    } catch (e) {
      throw(e)
    }
  },

  appleLogin: async () => {
    try {
      const csrf = Math.random().toString(36).substring(2, 15)
      const nonce = Math.random().toString(36).substring(2, 10)
      const hashedNonce = await Crypto.digestStringAsync(Crypto.CryptoDigestAlgorithm.SHA256, nonce)

      const appleCredential = await AppleAuthentication.signInAsync({
        requestedScopes: [
          AppleAuthentication.AppleAuthenticationScope.FULL_NAME,
          AppleAuthentication.AppleAuthenticationScope.EMAIL
        ],
        state: csrf,
        nonce: hashedNonce
      })

      const { identityToken, email, state } = appleCredential;
      const provider = new firebase.auth.OAuthProvider("apple.com")
      const credential = provider.credential({
        idToken: identityToken,
        rawNonce: nonce // nonce value from above
      })
      
      await firebase
        .auth()
        .signInWithCredential(credential)

      return true

    } catch (e) {
      throw(e)
    }
  },

  logout: async () => {
    firebase.auth().signOut().then(() => {
      return true
    }).catch((error) => {
      throw(error)
    });
  }

}