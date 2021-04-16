import React from 'react';
import {createDrawerNavigator} from '@react-navigation/drawer'
import {MainScreens} from '../../extra/constants'
import {Home, Collectibles, Scan, Market, Settings, Sidebar} from '../../screens/main'

const {Navigator, Screen} = createDrawerNavigator();

export const DrawerNavigator = () => {
    return (
        <Navigator 
            drawerContent={(props) => <Sidebar {...props} />}
            initialRouteName={MainScreens.Home} 
            screenOptions={{headerShown: false, animationEnabled: false}}>
                <Screen name={MainScreens.Home} component={Home} />
                <Screen name={MainScreens.Collectibles} component={Collectibles} />
                <Screen name={MainScreens.Scan} component={Scan} />
                <Screen name={MainScreens.Marketplace} component={Market} />
                <Screen name={MainScreens.Settings} component={Settings} />
        </Navigator>
    )
}