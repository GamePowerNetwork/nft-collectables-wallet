import React from 'react'
import styled from 'styled-components/native'
import { View } from 'react-native'

import { MaterialIcons  } from '@expo/vector-icons'
import globalStyles from '../extra/styles/global'
import * as constants from '../extra/constants'
import Text from './Text'


const NavigationView = ({...props}) => {
    return (
      <Navigation>
        <MaterialIcons  
            onPress={props.onPress}
            name={props.leftIconName} 
            size={props.leftIconSize} 
            style={{flex: 1}}
            color="white" />

        <NavigationTitle large center color="white">{props.title}</NavigationTitle>
        <View style={{flex: 1, alignItems: 'flex-end'}}>
            <Image source={props.icon}/>
        </View>
      </Navigation>
    )
}

export default NavigationView;


/* Styles */
const Navigation = styled.View`
    padding: 0px 32px 12px 32px;
    background-color: ${constants.PRIMARY_COLOR};
    flex-direction: row;
    align-items: center;
`

const NavigationTitle = styled(Text)`
    flex: 2;
`

const Image = styled.Image.attrs({
    resizeMode: 'contain'
})`
    width: 30px;
    height: 30px;
`