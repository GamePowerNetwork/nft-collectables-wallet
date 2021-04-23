import React from 'react';
import {createStackNavigator} from '@react-navigation/stack'
import {CollectiblesScreens} from '../../../extra/constants'
import {Collectibles, Series} from '../../../screens/main/collectibles'

const {Navigator, Screen} = createStackNavigator();

export const CollectiblesNavigator = () => {
    return (
        <Navigator 
            initialRouteName={CollectiblesScreens.Series} 
            screenOptions={{headerShown: false, animationEnabled: true}}>
                <Screen name={CollectiblesScreens.Collectibles} component={Collectibles} />
                <Screen name={CollectiblesScreens.Series} component={Series} />
        </Navigator>
    )
}