import * as Facebook from 'expo-facebook'
import * as Google from 'expo-google-app-auth'
import * as AppleAuthentication from 'expo-apple-authentication'

const GOOGLE_ANDROID_CLIENT_ID = "571002288984-kc2miucnquupq606p7qjcsch95vie0j9.apps.googleusercontent.com"
const GOOGLE_IOS_CLIENT_ID = "571002288984-t4tv9boccu8vhdpr8se7khrf1vctrq5b.apps.googleusercontent.com"

export default {
  fbLogin: async () => {
    try {
      //await Facebook.initializeAsync({appId: FACEBOOK_APP_ID})

      const { token, type } = await Facebook.logInWithReadPermissionsAsync(
        {
          permissions: ['public_profile']
        }
      )
  
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
    } catch (e) {
      return { error: e }
    }
  },

  googleLogin: async () => {
    try {
      const { type, accessToken, user } = await Google.logInAsync({
        androidStandaloneAppClientId: GOOGLE_ANDROID_CLIENT_ID,
        iosStandaloneAppClientId: GOOGLE_IOS_CLIENT_ID,
      })
  
      return { type, token: accessToken, user }
    } catch (e) {
      return { error: e }
    }
  },

  appleLogin: async () => {
    try {

      const credential = await AppleAuthentication.signInAsync({
        requestedScopes: [
          AppleAuthentication.AppleAuthenticationScope.FULL_NAME,
          AppleAuthentication.AppleAuthenticationScope.EMAIL
        ],
      })
      return credential;

    } catch (e) {
      if (e.code === 'ERR_CANCELED') {

      } else {
        // handle other errors
      }
    }
  }

}