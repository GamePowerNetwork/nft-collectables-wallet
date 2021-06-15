import 'react-native-gesture-handler'
import React, {useEffect} from 'react'
import {useFonts, Nunito_700Bold, Nunito_800ExtraBold} from '@expo-google-fonts/nunito'
import { StatusBar } from 'react-native'
import { Provider } from 'react-redux'
import { configureStore } from './src/redux'

import MainNav from './src/navigation/mainNav'
import WebViewService from './src/components/WebViewService';
import services from './src/services'
import AppLoading from 'expo-app-loading'

import * as firebase from 'firebase';

const firebaseConfig = {
  apiKey: "AIzaSyADkf-0C86lLa6b1wxcShYhiSpdNLO5Y9w",
  authDomain: "lootbox-wallet.firebaseapp.com",
  projectId: "lootbox-wallet",
  storageBucket: "lootbox-wallet.appspot.com",
  messagingSenderId: "571002288984",
  appId: "1:571002288984:web:7a987934b978feaa37c32d",
  measurementId: "G-SSGJEE8Y6Q"
};

export default function App() {
  let [fontsLoaded, error] = useFonts({ Nunito_700Bold, ExtraBold: Nunito_800ExtraBold })

  useEffect(() => {
    firebase.initializeApp(firebaseConfig);
  }, [])

  if(!fontsLoaded) {
      return (
          <AppLoading 
              onError={console.warn}
          />
      )
  }

  return (
    <Provider store={configureStore(services)}>
      <StatusBar barStyle="light-content" />
      <MainNav/>
      <WebViewService />
    </Provider>
  );
}