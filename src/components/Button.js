import React, {FC} from 'react'
import styled from 'styled-components/native'
import Text from './Text'
import * as constants from '../extra/constants'

const StyledButton = ({...props}) => {
    return (
        <Button {...props}>
            <Text bold center color={props.textColor ?? "#ffffff"}>{props.children}</Text>
        </Button>
    )
}

export default StyledButton;

const Button = styled.TouchableOpacity`
    background-color: ${props => props.color ?? constants.PRIMARY_COLOR};
    margin: ${props => props.margin ?? `10px 32px`};
    height: ${props => props.height ?? `48px`};
    width: ${props => props.width ?? '100%'};
    align-items: center;
    justify-content: center;
    border-radius: 6px;
`;