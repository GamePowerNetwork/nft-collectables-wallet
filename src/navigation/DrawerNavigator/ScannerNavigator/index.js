import React from 'react';
import {createStackNavigator} from '@react-navigation/stack'
import {ScannerScreens} from '../../../extra/constants'
import {Scan, Review} from '../../../screens/main/scanner'

const {Navigator, Screen} = createStackNavigator();

export const ScannerNavigator = () => {
    return (
        <Navigator 
            initialRouteName={ScannerScreens.Scan} 
            screenOptions={{headerShown: false, animationEnabled: true}}>
                <Screen name={ScannerScreens.Scan} component={Scan} />
                <Screen name={ScannerScreens.Review} component={Review} />
        </Navigator>
    )
}