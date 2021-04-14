import React, {useState} from 'react'
import { NavigationContainer } from '@react-navigation/native'

import AuthNavigator from './AuthNavigator'
import DrawerNavigator from './DrawerNavigator'

const MainNav = () => {
    const [isWalletCreated, setIsWalletCreated] = useState(true)

    return (
        <NavigationContainer>
            {isWalletCreated ? <DrawerNavigator /> : <AuthNavigator />}
        </NavigationContainer>
    )
}

export default MainNav;