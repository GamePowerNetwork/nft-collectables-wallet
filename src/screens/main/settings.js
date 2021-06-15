import React, {useState, useEffect, useRef} from 'react'
import {useSelector, useDispatch} from 'react-redux'
import { Text } from 'react-native'
import styled from 'styled-components/native'
import globalStyles from '../../extra/styles/global'

import { logout } from '../../redux/actions/auth.actions'


const Settings = ({navigation}) => {
    const dispatch = useDispatch()

    useEffect(() => {
        dispatch(logout())
    }, [])

    return (
        <SafeArea>
            <Container>
                
            </Container>
        </SafeArea>
    )
}

export default Settings;


/* Styles */
const SafeArea = styled.SafeAreaView`
    flex: 1;
`;

const Container = styled.View`
    flex: 1;
    justify-content: flex-end;
    padding: 0 32px 32px 32px;
`;