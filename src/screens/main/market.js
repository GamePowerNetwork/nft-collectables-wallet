import React from 'react'
import { Text } from 'react-native'
import styled from 'styled-components/native'
import globalStyles from '../../extra/styles/global'


const Market = ({navigation}) => {
    return (
        <SafeArea>
            <Container>
                
            </Container>
        </SafeArea>
    )
}

export default Market;


/* Styles */
const SafeArea = styled.SafeAreaView`
    flex: 1;
`;

const Container = styled.View`
    flex: 1;
    justify-content: flex-end;
    padding: 0 32px 32px 32px;
`;