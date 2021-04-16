import React from 'react'
import { Text } from 'react-native'
import styled from 'styled-components/native'
import globalStyles from '../../extra/styles/global'

import {AuthScreens} from '../../extra/constants'

import { Button } from 'react-native-elements'
import { View } from 'react-native'


const Welcome = ({navigation}) => {
    return (
        <SafeArea>
            <BackgroundImage source={require('../../../assets/Background.png')}/>
            <Container>
                <View style={{flex: 1}}></View>
                <Logo>
                    <Image source={require('../../../assets/LootBoxLogo-SwordTagLine.png')}/>
                </Logo>

                <CreateWalletButton 
                    title="Create a new wallet"
                    onPress={() => navigation.navigate(AuthScreens.CreatePassword)}
                />

                <RestoreWalletButton
                    title="I already have a wallet" 
                    type="clear"
                    onPress={() => navigation.navigate(AuthScreens.CreatePassword)}
                />
            </Container>
        </SafeArea>
    )
}

export default Welcome;


/* Styles */
const SafeArea = styled.SafeAreaView`
    flex: 1;
    background-color: silver;
`;

const Container = styled.View`
    flex: 1;
    justify-content: flex-end;
    padding: 0 32px 32px 32px;
`;

const Logo = styled.View`
    flex: 4;
    align-items: center;
    justify-content: center;
`

const CreateWalletButton = styled(Button).attrs({
    titleStyle: {
        color: "#ffffff",
        fontWeight: "600",
        fontSize: 16
    },
    buttonStyle: {
        backgroundColor: "#2c2c5c",
        height: 50,
        borderRadius: 6
    }
})``

const RestoreWalletButton = styled(Button).attrs({
    titleStyle: {
        color: "#2c2c5c",
        fontWeight: "600",
        fontSize: 16
    },
    buttonStyle: {
        height: 60
    },
})`
    margin-top: 16px;
`

const Image = styled.Image.attrs({
    resizeMode: 'contain'
})`
    width: 200px;
    height: 350px;
`

const BackgroundImage = styled.Image.attrs({
    resizeMode: 'stretch'
})`
    position: absolute;
    width: 100%;
    height: 120%;
    bottom: 0;
    top: 0;
`

const Main = styled.View`
    margin: 192px 0 32px;
`;