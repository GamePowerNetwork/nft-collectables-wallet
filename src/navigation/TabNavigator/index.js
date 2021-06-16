import React from 'react';
import {createBottomTabNavigator} from '@react-navigation/bottom-tabs'
import {MainScreens, CollectiblesScreens, ScannerScreens, PRIMARY_COLOR, SECONDARY_COLOR} from '../../extra/constants'
import {Drops, Market, Settings} from '../../screens/main'
import {CollectiblesNavigator} from './CollectibleNavigator'
import {ScannerNavigator} from './ScannerNavigator'

const {Navigator, Screen} = createBottomTabNavigator();

export const TabNavigator = () => {
    return (
        <Navigator 
            tabBarOptions={{
                showLabel: false,
                activeTintColor: SECONDARY_COLOR,
                inactiveTintColor: 'grey',
                style: {
                    backgroundColor: 'white',
                    position: 'absolute',
                    bottom: 25,
                    left: 20,
                    right: 20,
                    elevation: 0,
                    borderRadius: 20,
                    height: 90,
                },
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