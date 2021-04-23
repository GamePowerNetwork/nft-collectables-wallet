import React, {useState} from 'react'
import {useSelector} from 'react-redux'
import { NavigationContainer, DefaultTheme } from '@react-navigation/native'

import {AuthNavigator} from './AuthNavigator'
import {DrawerNavigator} from './DrawerNavigator'

const baseTheme = {
    ...DefaultTheme,
    colors: {
        ...DefaultTheme.colors,
        background: 'white'
    },
  };

const MainNav = () => {
    const [isWalletCreated, setIsWalletCreated] = useState(false)
    const { token } = useSelector((state) => state.authReducer)

    return (
        <NavigationContainer theme={baseTheme}>
            {(token != null) ? <DrawerNavigator /> : <AuthNavigator />}
        </NavigationContainer>
    )
}

export default MainNav;