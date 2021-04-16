import React from 'react'

import styled from 'styled-components/native'
import globalStyles from '../../extra/styles/global'

import Text from '../../components/Text'
import BaseContainer from '../../components/BaseContainer'
import SeriesTag from '../../components/SeriesTag'

const series = [
    { name: 'Dragon', key: "1"},
    { name: 'Deep Space', key: "2"},
    { name: 'Cyber Deck', key: "3"},
    { name: 'Weapons', key: "4"},
    { name: 'Rick & Morty', key: "5"},
    { name: 'Batman', key: "6"},
]

const items = [
    { name: 'test', key: "1"},
    { name: 'test', key: "2"},
    { name: 'test', key: "3"},
    { name: 'test', key: "4"},
    { name: 'test', key: "5"},
    { name: 'test', key: "6"},
]

const Home = ({navigation}) => {
    return (
        <BaseContainer 
            navigationMenuHandler={() => navigation.openDrawer()} 
            navigationTitle="Home" 
            navigationIcon={require('../../../assets/LootBoxLogo-BoxWhite.png')}>
            

            <ScrollView>
                <ScrollHeader>
                    <ListHeading large color="#f1461d">Hot Series 🔥</ListHeading>
                    <FlatList 
                        showsHorizontalScrollIndicator={false}
                        contentContainerStyle={{paddingRight: 20, paddingLeft: 20, marginTop: 10}}
                        horizontal 
                        data={series}
                        renderItem={({ item }) => (<SeriesTag color="#f1461d">{item.name}</SeriesTag>)}
                    />
                </ScrollHeader>
                <Content>
                    <Title header>Discover</Title>
                    <ListHeading large heavy color="grey">Loot Drops 💎</ListHeading>
                    <FlatList 
                        showsHorizontalScrollIndicator={false}
                        contentContainerStyle={{paddingRight: 20, paddingLeft: 20}}
                        horizontal 
                        data={items}
                        renderItem={({ item }) => (<FeaturedItem />)}
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

export default Home;


/* Styles */
const ScrollView = styled.ScrollView`
    
`

const FlatList = styled.FlatList`
    margin-bottom: 22px;
`

const ScrollHeader = styled.View`
    padding: 30px 0 20px 0;
    background-color: #2c2c5c;
    height: 190px;
    flex: 1;
`

const Content = styled.View`
    margin-top: 10px;
    padding-top: 30px;
    padding-bottom: 100px;
    background-color: white;
    border-radius: 30px;
`;

const FeaturedItem = styled.View`
    border-radius: 30px;
    background-color: lightgrey;
    height: 360px;
    width: 320px;
    margin-horizontal: 10px;
`

const Title = styled(Text)`
    padding: 0 32px 10px 32px;
`

const ListHeading = styled(Text)`
    padding: 0 0 10px 32px;
`