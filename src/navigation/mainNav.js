import React, {useState, useEffect} from 'react'
import {useSelector} from 'react-redux'
import { Alert } from 'react-native'
import { NavigationContainer, DefaultTheme } from '@react-navigation/native'

import {AuthNavigator} from './AuthNavigator'
import {TabNavigator} from './TabNavigator'

const baseTheme = {
    ...DefaultTheme,
    colors: {
        ...DefaultTheme.colors,
        background: 'white'
    },
  };

const MainNav = () => {
    const [isWalletCreated, setIsWalletCreated] = useState(false)
    const { token, error } = useSelector((state) => state.authReducer)

    useEffect(() => {
        if(error !== null) {
            Alert.alert("Error", error.message, [{text: 'OK'}])
        }
    }, [error])

    return (
        <NavigationContainer theme={baseTheme}>
            {(token !== null) ? <TabNavigator /> : <AuthNavigator />}
        </NavigationContainer>
    )
}

export default MainNav;