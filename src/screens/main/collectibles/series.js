import React, {useState, useEffect} from 'react'
import { FlatList } from 'react-native'
import {useSelector, useDispatch} from 'react-redux'
import styled from 'styled-components/native'
import globalStyles from '../../../extra/styles/global'

import * as constants from '../../../extra/constants'
import { fetchSeries } from '../../../redux/actions'

import {BaseContainer, SeriesThumbnail} from '../../../components'




const NUMBER_OF_COLUMNS = 2

const formatListData = (data, numColumns) => {
    const numberOfFullRows = Math.floor(data.length / numColumns)

    let numberOfElementsLastRow = data.length - (numberOfFullRows * numColumns)
    while (numberOfElementsLastRow !== numColumns && numberOfElementsLastRow !== 0) {
        data.push({ id: `blank-${numberOfElementsLastRow}`, empty: true})
        numberOfElementsLastRow = numberOfElementsLastRow + 1
    }

    return data
}

const Series = ({navigation}) => {
    const dispatch = useDispatch()
    const { series } = useSelector((state) => state.nftReducer)

    useEffect(() => {
        dispatch(fetchSeries())
    }, [dispatch])

    return (
        <BaseContainer 
            navigationMenuHandler={() => navigation.openDrawer()} 
            navigationTitle="Series"
            navigationLeftIconType="menu"
            navigationIcon={require('../../../../assets/LootBoxLogo-BoxWhite.png')}>

                <SeriesList 
                    contentContainerStyle={{paddingTop: 25, paddingBottom: 40}}
                    showsHorizontalScrollIndicator={false}
                    numColumns={NUMBER_OF_COLUMNS}
                    keyExtractor={item => item.id}
                    data={formatListData(series, NUMBER_OF_COLUMNS)}
                    renderItem={({ item }) => (
                        <SeriesThumbnail item={item} onPress={() => { navigation.navigate(constants.CollectiblesScreens.Collectibles, {item}) }} />
                    )}
                />

        </BaseContainer>
    )
}

export default Series;


/* Styles */
const SeriesList = styled(FlatList)`
    flex: 1;
    background-color: ${constants.BACKGROUND_COLOR};
    border-radius: 30px;
`