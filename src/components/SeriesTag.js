import React from 'react'
import styled from 'styled-components/native'
import Text from './Text'

import * as constants from '../extra/constants'

const SeriesTag = ({...props}) => {
    return (
        <Tag {...props}>
            <Title medium bold center color={props.textColor ?? constants.SECONDARY_COLOR}>{props.children}</Title>
        </Tag>
    )
}

export default SeriesTag;

const Tag = styled.View`
    border-radius: 20px;
    background-color: ${props => props.color ?? constants.BACKGROUND_LIGHT};
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