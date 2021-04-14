import React from 'react';
import {createStackNavigator} from '@react-navigation/stack'

import {Login, Welcome, Phrase, Password} from '../../screens/auth'

export const AuthScreens = {
    Welcome: 'Welcome',
    Login: 'Login',
    CreatePassword: 'CreatePassword',
    CreatePhrase: 'CreatePhrase',
}

const {Navigator, Screen} = createStackNavigator();

const AuthNavigator = () => {
    return (
        <Navigator initialRouteName={AuthScreens.Welcome} screenOptions={{headerShown: false, animationEnabled: false}}>
            <Screen name={AuthScreens.Welcome} component={Welcome} />
            <Screen name={AuthScreens.CreatePassword} component={Password} />
            <Screen name={AuthScreens.CreatePhrase} component={Phrase} />
            <Screen name={AuthScreens.Login} component={Login} />
        </Navigator>
    )
}

export default AuthNavigator;