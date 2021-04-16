import React from 'react'
import styled from 'styled-components/native'
import { View } from 'react-native'

import { Entypo } from '@expo/vector-icons'
import globalStyles from '../extra/styles/global'
import Text from './Text'


const NavigationView = ({...props}) => {
    return (
      <Navigation>
        <Entypo 
            onPress={props.onPress}
            name="menu" 
            size={24} 
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
    background-color: #2c2c5c;
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