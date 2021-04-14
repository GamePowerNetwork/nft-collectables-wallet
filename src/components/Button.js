import React, {FC} from 'react'
import styled from 'styled-components/native'
import Text from './Text'

const StyledButton = ({...props}) => {
    return (
        <Button {...props}>
            <Text bold center color={props.textColor ?? "#ffffff"}>{props.children}</Text>
        </Button>
    )
}

export default StyledButton;

const Button = styled.TouchableOpacity`
    background-color: ${props => props.color ?? "#8022d9"};
    margin: ${props => props.margin ?? `0 32px`};
    height: ${props => props.height ?? `48px`};
    align-items: center;
    justify-content: center;
    border-radius: 6px;
`;