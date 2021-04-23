import React, {useState, useEffect} from 'react'
import {useSelector, useDispatch} from 'react-redux'
import styled from 'styled-components/native'
import globalStyles from '../../../extra/styles/global'

import * as constants from '../../../extra/constants'

import {Text, Button, BaseContainer} from '../../../components'



const Review = ({navigation}) => {

    return (
        <BaseContainer 
            navigationMenuHandler={() => navigation.openDrawer()} 
            navigationTitle="QR Scanner"
            navigationLeftIconType="menu"
            navigationIcon={require('../../../../assets/LootBoxLogo-BoxWhite.png')}>

            <Container>
                <Text>Review Screen</Text>
            </Container>
        </BaseContainer>
    )
}

export default Review


/* Styles */
const Container = styled.View`
    flex: 1;
    justify-content: center;
    align-items: center;
    background-color: ${constants.BACKGROUND_LIGHT};
`