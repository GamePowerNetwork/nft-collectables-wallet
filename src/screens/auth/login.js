import React from 'react';
import Text from '../../components/Text'

import styled from 'styled-components/native'

const Login = () => {
    return (
        <Container>
            <Main>
                <Text title bold center>Create Your Password</Text>
            </Main>
            <HeaderGraphic>
                <RightCircle />
                <LeftCircle />
            </HeaderGraphic>

            <Auth>
                <AuthContainer>
                    <AuthTitle>Password</AuthTitle>
                    <AuthField secureTextEntry autoCapitalize="none" autoCompleteType="password" autoCorrect={false} />

                    <AuthTitle>Confirm Password</AuthTitle>
                    <AuthField secureTextEntry autoCapitalize="none" autoCompleteType="password" autoCorrect={false} />
                </AuthContainer>
            </Auth>

            <Spacer />

            <SignInContainer>
                <Text bold center color="#ffffff">
                    Create Password
                </Text>
            </SignInContainer>

            <CreateWalletButton>
                <Text small center>
                    Need a Collectibles Wallet?{" "}
                
                    <Text bold color="#8022d9">
                        Create One Here.
                    </Text>
                </Text>
            </CreateWalletButton>

            <StatusBar barStyle="light-content" />
        </Container>
    )
}

export default Login;

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
    margin: 64px 32px 32px;
`

const AuthContainer = styled.View`
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

const SignInContainer = styled.TouchableOpacity`
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