import React, {useState} from 'react'
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
    const [isWalletCreated, setIsWalletCreated] = useState(true)

    return (
        <NavigationContainer theme={baseTheme}>
            {isWalletCreated ? <DrawerNavigator /> : <AuthNavigator />}
        </NavigationContainer>
    )
}

export default MainNav;