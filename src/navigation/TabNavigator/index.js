import React from 'react';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs'
import {MainScreens, CollectiblesScreens, ScannerScreens} from '../../extra/constants'
import {Drops, Market, Settings} from '../../screens/main'
import {CollectiblesNavigator} from './CollectibleNavigator'
import {ScannerNavigator} from './ScannerNavigator'

const {Navigator, Screen} = createBottomTabNavigator();

export const TabNavigator = () => {
    return (
        <Navigator 
            tabBarOptions={{
                showLabel: false
            }}
            initialRouteName={MainScreens.Drops} 
            screenOptions={{headerShown: false, animationEnabled: false}}>
                <Screen name={MainScreens.Drops} component={Drops} />
                <Screen name={CollectiblesScreens.Collectibles} component={CollectiblesNavigator} />
                <Screen name={ScannerScreens.Scan} component={ScannerNavigator} />
                <Screen name={MainScreens.Marketplace} component={Market} />
                <Screen name={MainScreens.Settings} component={Settings} />
        </Navigator>
    )
}