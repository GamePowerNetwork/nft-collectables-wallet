import React from 'react'
import { View } from 'react-native'
import styled from 'styled-components/native'
import Text from './Text'

import * as constants from '../extra/constants'

const Content = ({...props}) => {
  if(props.item.empty === true) {
    return (
      <EmptyView />
    )
  }
  return (
    <Thumbnail onPress={props.onPress}>
      <ThumbnailImage source={{uri: props.item.image}}>
        <View style={{flex: 1}}>
          <TitleBadge>
            <Title small bold color="white">{props.item.name}</Title>
          </TitleBadge>
        </View>
        <CountBadge>
          <Title medium bold center color="white">{props.item.count}</Title>
        </CountBadge>
      </ThumbnailImage>
    </Thumbnail>
  )
}

const SeriesThumbnail = ({...props}) => {
    return (
        <Container>
            <Content {...props} item={props.item} />
        </Container>
    )
}

export default SeriesThumbnail;

const Container = styled.View`
  flex: 1;
  padding: 5px;
  padding-top: 5px;
  padding-bottom: 10px;
`

const Thumbnail = styled.TouchableOpacity`
    background-color: ${constants.PRIMARY_COLOR};
    flex: 1;
    width: 100%;
    height: 200px;
    border-radius: 20px;
    overflow: hidden;
`

const EmptyView = styled.View`
  background-color: transparent;
`

const TitleBadge = styled.View`
  align-self: flex-start;
  border-radius: 10px;
  background-color: ${constants.PRIMARY_COLOR};
  opacity: 0.8;
`

const CountBadge = styled.View`
  align-self: flex-end;
  border-radius: 10px;
`

const Title = styled(Text)`
  padding: 5px;
`

const ThumbnailImage = styled.ImageBackground.attrs({
  imageStyle: {
    borderRadius: 20,
    borderBottomRightRadius: 120,
    resizeMode: 'cover'
  }
})`
  flex: 1;
  flex-direction: column;
  margin: 4px;
  margin-bottom: 5px;
  padding: 10px;
  padding-right: 0;
  padding-bottom: 0;
`