import React from 'react'
import styled from 'styled-components/native'
import globalStyles from '../extra/styles/global'
import * as constants from '../extra/constants'

import NavigationView from './NavigationView'



const BaseContainer = ({...props}) => {
    return (
        <Container>
            <SafeArea>
                <NavigationView 
                    onPress={props.navigationMenuHandler} 
                    title={props.navigationTitle} 
                    leftIconName={(props.navigationLeftIconType == 'back') ? constants.BACK_ICON : (props.navigationLeftIconType == 'back') ? constants.MENU_ICON : null}
                    leftIconSize={(props.navigationLeftIconType == 'back') ? 20 : (props.navigationLeftIconType == 'back') ? 30 : 0}
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
    background-color: ${constants.PRIMARY_COLOR};
`

const Container = styled.View`
    flex: 1;
    background-color: ${constants.PRIMARY_COLOR};
`

const Content = styled.View`
    flex: 1;
`