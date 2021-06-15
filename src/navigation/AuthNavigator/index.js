import React from 'react';
import {createStackNavigator} from '@react-navigation/stack'
import {AuthScreens} from '../../extra/constants'
import screens from '../../screens/auth'

const {Navigator, Screen} = createStackNavigator();

export const AuthNavigator = () => {
    return (
        <Navigator initialRouteName={AuthScreens.Welcome} screenOptions={{headerShown: false, animationEnabled: false}}>
            <Screen name={AuthScreens.Welcome} component={screens.Welcome} />
            <Screen name={AuthScreens.CreatePassword} component={screens.Password} />
            <Screen name={AuthScreens.CreatePhrase} component={screens.Phrase} />
            <Screen name={AuthScreens.Login} component={screens.Login} />
        </Navigator>
    )
}