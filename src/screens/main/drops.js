import React, {useRef} from 'react'
import { Animated, Dimensions, Image, View } from 'react-native'

import styled from 'styled-components/native'
import globalStyles from '../../extra/styles/global'
import * as constants from '../../extra/constants'

import {Text, BaseContainer, SeriesTag} from '../../components'

const { width, height } = Dimensions.get('screen')
const ITEM_WIDTH = 320
const ITEM_HEIGHT = 360

const series = [
    { name: 'Dragons', key: "1"},
    { name: 'Space Ships', key: "2"},
    { name: 'Cyber Deck', key: "3"},
    { name: 'Weapons', key: "4"},
    { name: 'Rick & Morty', key: "5"},
    { name: 'Batman', key: "6"},
]

const images = [
    "https://images.unsplash.com/photo-1618386230353-3631c1365be2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1955&q=80",
    "https://images.unsplash.com/photo-1618510050510-d0903984e131?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
    "https://images.unsplash.com/photo-1618423835741-bf2cce88d21d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
    "https://images.unsplash.com/photo-1618449625138-62cb2b8a343a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
    "https://images.unsplash.com/photo-1618423835718-df9d86abc3bd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80",
    "https://images.unsplash.com/photo-1618513847270-992347f2c59c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1567&q=80"
]

const drops = images.map((image, index) => ({
    key: String(index),
    photo: image,
}));


const Drops = ({navigation}) => {
    const scrollX = useRef(new Animated.Value(0)).current;

    return (
        <BaseContainer 
            navigationTitle="Drops 🔥" >
            

            <ScrollView>
                <ScrollHeader>
                    <ListHeading large color={constants.SECONDARY_COLOR}>Hot Series 🔥</ListHeading>
                    <FlatList 
                        showsHorizontalScrollIndicator={false}
                        contentContainerStyle={{paddingRight: 20, paddingLeft: 20, marginTop: 10}}
                        horizontal 
                        data={series}
                        renderItem={({ item }) => (<SeriesTag textColor="white" color={constants.SECONDARY_COLOR}>{item.name}</SeriesTag>)}
                    />
                </ScrollHeader>
                <Content>
                    <Title header color="silver">Discover</Title>
                    <ListHeading large heavy color="grey">Featured Drops ⚡</ListHeading>
                    <Animated.FlatList 
                        contentContainerStyle={{paddingRight: 20, paddingLeft: 20, marginBottom: 20}}
                        horizontal 
                        showsHorizontalScrollIndicator={false}
                        keyExtractor={item => item.key}
                        data={drops}
                        onScroll={Animated.event(
                            [{nativeEvent: {contentOffset: {x: scrollX}}}],
                            {useNativeDriver: true}
                        )}
                        renderItem={({ item, index }) => {
                            const inputRange = [
                                (index - 1) * width,
                                index * width,
                                (index + 1) * width
                            ]

                            const translateX = scrollX.interpolate({
                                inputRange,
                                outputRange: [-width * .15, 0, width * .15]
                            })
                            return (
                                <View style={{ width: ITEM_WIDTH + 30, justifyContent: 'center', alignItems: 'center' }}>
                                    <View style={{ 
                                        width: ITEM_WIDTH, 
                                        height: ITEM_HEIGHT, 
                                        overflow: 'hidden', 
                                        alignItems: 'center',
                                        borderRadius: 20
                                    }}>
                                        <Animated.Image 
                                            source={{uri: item.photo}}
                                            style={{
                                                width: ITEM_WIDTH * 1.4,
                                                height: ITEM_HEIGHT,
                                                resizeMode: 'cover',
                                                transform: [
                                                    {
                                                        translateX
                                                    }
                                                ]
                                            }}
                                        />
                                    </View>
                                </View>
                            )
                        }}
                    />

                    <ListHeading large heavy color="grey">Series ✨</ListHeading>
                    <FlatList 
                        showsHorizontalScrollIndicator={false}
                        contentContainerStyle={{paddingRight: 20, paddingLeft: 20}}
                        horizontal 
                        data={series}
                        renderItem={({ item }) => (<SeriesTag>{item.name}</SeriesTag>)}
                    />
                </Content>
            </ScrollView>
        </BaseContainer>
    )
}

export default Drops;


/* Styles */
const ScrollView = styled.ScrollView`
    
`

const FlatList = styled.FlatList`
    margin-bottom: 22px;
`

const ScrollHeader = styled.View`
    padding: 30px 0 20px 0;
    background-color: ${constants.PRIMARY_COLOR};
    height: 190px;
    flex: 1;
`

const Content = styled.View`
    margin-top: 10px;
    padding-top: 30px;
    padding-bottom: 100px;
    background-color: ${constants.BACKGROUND_COLOR};
    border-radius: 30px;
`;

const Title = styled(Text)`
    padding: 0 32px 10px 32px;
`

const ListHeading = styled(Text)`
    padding: 0 0 10px 32px;
`