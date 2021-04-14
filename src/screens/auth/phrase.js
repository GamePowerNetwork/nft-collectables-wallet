import React, {useEffect, useState} from 'react'
import {useSelector, useDispatch} from 'react-redux'
import styled from 'styled-components/native'


import { CheckBox, Button } from 'react-native-elements'
import Text from '../../components/Text'
//import Button from '../components/Button'
import { generatePhrase } from '../../redux/actions'


const Phrase = () => {
    const dispatch = useDispatch()
    const [phraseSaved, setPhraseSaved] = useState(false)
    const { phrase } = useSelector((state) => state.keyringReducer)

    useEffect(() => {
        dispatch(generatePhrase())
    }, [])

    return (
        <Container>
            <Main>
                <ScreenTitle title bold>Create Wallet</ScreenTitle>
            </Main>

            <Divider />

            <MnemonicSeed>
                <Text color={"silver"} title center heavy>{phrase}</Text>
            </MnemonicSeed>

            <Warning>
                <Text heavy small center color="brown">
                    Never share this phrase with anyone. Make sure you write it down and store it in a safe place.
                    If you lose this code, you will lose access to your items.
                </Text>
            </Warning>

            <Divider />

            <CheckBoxContainer>
                <CheckBox
                    center
                    title='I have written down my private phrase and saved it somewhere safe.'
                    containerStyle={{ backgroundColor: 'transparent', borderColor: 'transparent' }}
                    checked={phraseSaved}
                    onPress={() => setPhraseSaved(!phraseSaved)}
                    />
            </CheckBoxContainer>
            
            <Spacer />

            <Button 
                disabled={!phraseSaved}
                raised
                title="Continue"
            />

            <StatusBar barStyle="light-content" />
        </Container>
    )
}

export default Phrase;

/* Styles */
const Container = styled.View`
    flex: 1;
    justify-content: center;
    align-content: center;
    margin: 0 32px 0 32px;
    /*background-color: rgb(41, 18, 71);*/
`;

const Main = styled.View`
    margin: 22px 0 0;
`;

const ScreenTitle = styled(Text)``


const StatusBar = styled.StatusBar`
`;

const Warning = styled.View`
    margin-top: 34px;
    padding: 30px;
    background-color: #ebd7ad;
    border-radius: 10px;
`

const CheckBoxContainer = styled.View`
    
`

const MnemonicSeed = styled.View`
    margin: 20px 0 20px 0;
`

const Spacer = styled.View`
    flex: .4;
`

const Divider = styled.View`
    border-bottom-color: #dddddd;
    border-bottom-width: 2px;
    margin: 30px 0 30px 0;
`