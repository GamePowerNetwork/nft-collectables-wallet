import React from 'react'
import { FlatList } from 'react-native'
import styled from 'styled-components/native'
import globalStyles from '../../extra/styles/global'

import BaseContainer from '../../components/BaseContainer'
import SeriesThumbnail from '../../components/SeriesThumbnail'

const items = [
    { name: 'test', key: "1"},
    { name: 'test', key: "2"},
    { name: 'test', key: "3"},
    { name: 'test', key: "4"},
    { name: 'test', key: "5"},
    { name: 'test', key: "6"},
    { name: 'test', key: "7"},
    { name: 'test', key: "8"},
    { name: 'test', key: "9"},
    { name: 'test', key: "10"},
    { name: 'test', key: "11"},
    { name: 'test', key: "12"},
    { name: 'test', key: "13"},
]

const numberOfColumns = 2

const formatListData = (data, numColumns) => {
    const numberOfFullRows = Math.floor(data.length / numColumns)

    let numberOfElementsLastRow = data.length - (numberOfFullRows * numColumns)
    while (numberOfElementsLastRow !== numColumns && numberOfElementsLastRow !== 0) {
        data.push({ key: `blank-${numberOfElementsLastRow}`, empty: true})
        numberOfElementsLastRow = numberOfElementsLastRow + 1
    }

    return data
}

const Collectibles = ({navigation}) => {
    return (
        <BaseContainer 
            navigationMenuHandler={() => navigation.openDrawer()} 
            navigationTitle="Collectibles"
            navigationIcon={require('../../../assets/LootBoxLogo-BoxWhite.png')}>

                <CollectiblesList 
                    contentContainerStyle={{paddingTop: 50, paddingBottom: 40}}
                    showsHorizontalScrollIndicator={false}
                    numColumns={numberOfColumns}
                    data={formatListData(items, numberOfColumns)}
                    renderItem={({ item }) => (<SeriesThumbnail item={item} />)}
                />

        </BaseContainer>
    )
}

export default Collectibles;


/* Styles */
const CollectiblesList = styled(FlatList)`
    flex: 1;
    background-color: #ffffff;
    border-radius: 30px;
`