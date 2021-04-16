import React from 'react'
import styled from 'styled-components/native'
import globalStyles from '../extra/styles/global'

import NavigationView from './NavigationView'



const BaseContainer = ({...props}) => {
    return (
        <Container>
            <SafeArea>
                <NavigationView 
                    onPress={props.navigationMenuHandler} 
                    title={props.navigationTitle} 
                    icon={props.navigationIcon} 
                />
                
            </SafeArea>
            <Content>
                {props.children}
            </Content>
        </Container>
    )
}

export default BaseContainer;


/* Styles */
const SafeArea = styled.SafeAreaView`
    background-color: #2c2c5c;
`

const Container = styled.View`
    flex: 1;
    background-color: #2c2c5c;
`

const Content = styled.View`
    flex: 1;
`