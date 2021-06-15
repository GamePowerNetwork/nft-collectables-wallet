import React, {useEffect, useState, useRef} from 'react'
import {useSelector, useDispatch} from 'react-redux'
import {Asset} from 'expo-asset';
import * as FileSystem from 'expo-file-system';

import { WebView } from 'react-native-webview';
import { generatePhraseSuccess } from '../redux/actions';

const WebViewService = () => {
  const dispatch = useDispatch()
  const [html, setHtml] = useState('')
  const webView = useRef(null);
  const { request } = useSelector((state) => state.apiReducer)

  useEffect(() => {
    getAPIWebView();
  }, [])

  useEffect(() => {
    if(request === undefined) return

    const clientResponseCode = `
      window.postMessage(${JSON.stringify(request)}, "*");
      true;
    `;

    if (webView) {
      webView.current.injectJavaScript(clientResponseCode);
    }
  }, [request])

  const getAPIWebView = async() => {
    const [{ localUri }] = await Asset.loadAsync(require('../../api/build/index.html'))
    const fileContents = await FileSystem.readAsStringAsync(localUri)
    setHtml(fileContents)
  }

  const onSDKMessage = (event) => {
    const { data } = event.nativeEvent

    try {
      const result = JSON.parse(data)
      dispatch(result)
    } catch(error) {
      //
    }
  }

  return (
    <WebView 
      ref={webView}
      originWhitelist={['*']}
      source={{ html }} 
      containerStyle={{ position: "absolute", width: 0, height: 0 }}
      onMessage={event => onSDKMessage(event)}
    />
  );
}

export default WebViewService;