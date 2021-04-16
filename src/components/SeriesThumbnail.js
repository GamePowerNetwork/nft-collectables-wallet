import React from 'react'
import styled from 'styled-components/native'
import Text from './Text'

const Content = ({...props}) => {
  if(props.item.empty === true) {
    return (
      <EmptyView />
    )
  }
  return (
    <Thumbnail>
      <Title medium bold center color="black">{props.item.name}</Title>
    </Thumbnail>
  )
}

const SeriesThumbnail = ({...props}) => {
    return (
        <Container>
            <Content item={props.item} />
        </Container>
    )
}

export default SeriesThumbnail;

const Container = styled.View`
  flex: 1;
  padding: 10px;
  padding-top: 10px;
  padding-bottom: 20px;
`

const Thumbnail = styled.View`
    background-color: silver;
    flex: 1;
    width: 100%;
    height: 200px;
    border-radius: 20px;
`

const EmptyView = styled.View`
  background-color: red;
`

const Title = styled(Text)`

`