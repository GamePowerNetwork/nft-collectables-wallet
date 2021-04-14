import 'react-native-gesture-handler'
import React from 'react'
import {useFonts, Nunito_700Bold, Nunito_800ExtraBold} from '@expo-google-fonts/nunito'
import { StatusBar } from 'react-native'
import { Provider } from 'react-redux'
import { configureStore } from './src/redux'

import MainNav from './src/navigation/mainNav'
import WebViewService from './src/components/WebViewService';
import services from './src/services'
import AppLoading from 'expo-app-loading'

export default function App() {
  let [fontsLoaded, error] = useFonts({ Nunito_700Bold, ExtraBold: Nunito_800ExtraBold })

  if(!fontsLoaded) {
      return (
          <AppLoading 
              onError={console.warn}
          />
      )
  }

  return (
    <Provider store={configureStore(services)}>
      <StatusBar barStyle="dark-content" hidden />
      <MainNav/>
      <WebViewService />
    </Provider>
  );
}