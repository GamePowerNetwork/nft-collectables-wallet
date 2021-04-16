import React from 'react'
import styled from 'styled-components/native'
import Text from './Text'

const SeriesTag = ({...props}) => {
    return (
        <Tag {...props}>
            <Title medium bold center color={props.textColor ?? "#ffffff"}>{props.children}</Title>
        </Tag>
    )
}

export default SeriesTag;

const Tag = styled.View`
    border-radius: 30px;
    background-color: ${props => props.color ?? "#404fa3"};
    height: 60px;
    width: 200px;
    flex: 1;
    justify-content: center;
    align-items: center;
    align-content: center;
    margin-horizontal: 10px;
`

const Title = styled(Text)`

`