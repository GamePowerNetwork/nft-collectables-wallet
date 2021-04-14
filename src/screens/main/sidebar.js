import React from 'react'
import styled from 'styled-components/native'
import globalStyles from '../../extra/styles/global'
import { View, Text, StyleSheet, ScrollView, ImageBackground} from 'react-native'
import { DrawerNavigatorItems, DrawerContentScrollView, DrawerItemList } from '@react-navigation/drawer'

const Sidebar = (props) => {
    return (
        <SafeArea>
            <View style={styles.header}>
                <Logo>
                    <Image source={require('../../../assets/TokenLogo.png')}/>
                    <Text style={globalStyles.largeText}>NFT Wallet</Text>
                </Logo>
            </View>
            <DrawerItemList {...props} />
        </SafeArea>
    )
}

export default Sidebar

const styles = StyleSheet.create({
    header: {
        padding: 16,
        paddingTop: 28,
        minHeight: 180
    },
})

const SafeArea = styled.SafeAreaView`
    flex: 1;
`;

const Logo = styled.View`
    flex: 1;
    align-items: center;
    justify-content: center;
`
const Image = styled.Image`
    width: 75px;
    height: 85px;
`