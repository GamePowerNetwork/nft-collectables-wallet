import React, {FC} from 'react';
import styled from 'styled-components/native'

import {AuthScreens} from '../../navigation/AuthNavigator'

import Text from '../../components/Text'
import Button from '../../components/Button';


const Password = ({navigation}) => {
    return (
        <Container>
            <Main>
                <Text large bold>Create Your Password</Text>
            </Main>
            <HeaderGraphic>
                <RightCircle />
                <LeftCircle />
            </HeaderGraphic>

            <Auth>
                <AuthContainer>
                    <AuthTitle>Password</AuthTitle>
                    <AuthField 
                        secureTextEntry 
                        autoFocus={true} 
                        autoCapitalize="none" 
                        autoCompleteType="password" 
                        autoCorrect={false} 
                    />
                </AuthContainer>

                <AuthContainer>
                    <AuthTitle>Confirm Password</AuthTitle>
                    <AuthField 
                        secureTextEntry 
                        autoCapitalize="none" 
                        autoCompleteType="password" 
                        autoCorrect={false} 
                    />
                </AuthContainer>
            </Auth>

            <Spacer />

            <CreateButton 
                onPress={() => navigation.navigate(AuthScreens.CreatePhrase)}
                >
                <Text bold center color="#ffffff">
                    Create Password
                </Text>
            </CreateButton>

            <StatusBar barStyle="light-content" />
        </Container>
    )
}

export default Password;

/* Styles */
const Container = styled.View`
    flex: 1;
    justify-content: center;
    align-content: center;
    /*background-color: rgb(41, 18, 71);*/
`;

const Main = styled.View`
    margin: 192px 32px 32px;
`;

const HeaderGraphic = styled.View`
    position: absolute;
    width: 100%;
    top: -50px;
    z-index: -100;
`;

const RightCircle = styled.View`
    background-color: #8022d9;
    position: absolute;
    width: 400px;
    height: 400px;
    border-radius: 200px;
    right: -100px;
    top: -200px;
`;

const LeftCircle = styled.View`
    background-color: #23A6D5;
    position: absolute;
    width: 200px;
    height: 200px;
    border-radius: 100px;
    left: -50px;
    top: -50px;
`;

const StatusBar = styled.StatusBar`
`;

const Auth = styled.View`
    margin: 34px 32px 0 32px;
`

const AuthContainer = styled.View`
    margin-bottom: 32px;
`

const AuthTitle = styled(Text)`
    color: #8022d9;
    font-size: 12px;
    text-transform: uppercase;
    font-weight: 700;
`

const AuthField = styled.TextInput`
    border-bottom-color: #8e93a1;
    border-bottom-width: 0.5px;
    height: 48px;
`

const CreateButton = styled(Button)`
    margin: 0 32px;
    height: 48px;
    align-items: center;
    justify-content: center;
    background-color: #8022d9;
    border-radius: 6px;
`

const CreateWalletButton = styled.TouchableOpacity`
    margin-top: 16px;
`

const Spacer = styled.View`
    flex: .4;
`