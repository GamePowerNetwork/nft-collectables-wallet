import React, {useState, useEffect, useRef} from 'react'
import {useSelector, useDispatch} from 'react-redux'
import {View, StyleSheet} from 'react-native'
import styled from 'styled-components/native'
import globalStyles from '../../../extra/styles/global'
import { BlurView } from 'expo-blur';
import Animated from 'react-native-reanimated';
import BottomSheet from 'reanimated-bottom-sheet';

import * as constants from '../../../extra/constants'

import {Text, Button, BaseContainer} from '../../../components'
import { claimNFT, claimPendingNFT } from '../../../redux/actions/nft.actions'



const Review = ({navigation, route}) => {
    const dispatch = useDispatch()
    const { approvedClaim, pendingClaims } = useSelector((state) => state.nftReducer)
    const { connection } = useSelector((state) => state.providerReducer)
    const sheetRef = useRef(null);

    useEffect(() => {
        dispatch(claimNFT(route.params.claim))
    }, [])

    useEffect(() => {
        if(connection.connection && !connection.isConnecting) {
            if(pendingClaims.length > 0) {
                dispatch(claimPendingNFT())
            }
        }
    }, [connection])

    const LoadingView = () => {
        return (
                <Text>Loading Collectible Data</Text>
        )
    }

    const ClaimView = () => {
        return (
            <NFTContainer>
                <PreviewImageBackground>
                    <Text large bold color="white">{approvedClaim.metadata.name}</Text>
                </PreviewImageBackground>

                <ShadowView>
                    <PreviewImage source={{uri: approvedClaim.metadata.image}} />
                </ShadowView>

                <ButtonHolder>
                    <Button height="100px" color="transparent" onPress={() => sheetRef.current.snapTo(0)}>View Properties</Button>
                    <Button color={constants.BACKGROUND_LIGHT} textColor={constants.PRIMARY_COLOR}>Claim Loot</Button>
                    <Button color={constants.SECONDARY_COLOR}>Decline Loot</Button>
                </ButtonHolder>
            </NFTContainer>
        )
    }

    const sheetContent = () => (
        <View
          style={{
            backgroundColor: 'white',
            padding: 16,
            height: 550,
          }}
        >
          <Text>Swipe down to close</Text>
        </View>
      );

    return (
        <BaseContainer 
            navigationMenuHandler={() => navigation.pop()} 
            navigationTitle="Review Loot"
            navigationLeftIconType="back"
            navigationIcon={require('../../../../assets/LootBoxLogo-BoxWhite.png')}>

            {(approvedClaim) && <PreviewImage source={{uri: approvedClaim.metadata.image}} /> }

            <BlurView intensity={98} tint="dark" style={[StyleSheet.absoluteFill]}>
                <Container>
                    <BackgroundCircle />

                    {(approvedClaim === null) && LoadingView() }

                    {(approvedClaim) && ClaimView() }
                </Container>
            </BlurView>

            <BottomSheet
                ref={sheetRef}
                initialSnap={1}
                snapPoints={[500, 0]}
                borderRadius={30}
                renderContent={sheetContent}
            />
        

        </BaseContainer>
    )
}

export default Review


/* Styles */
const Container = styled.View`
    flex: 1;
    justify-content: flex-start;
    align-items: center;
`

const NFTContainer = styled.View`
    width: 100%;
    flex: 1;
    justify-content: flex-start;
    align-items: center;
`

const PreviewImage = styled.Image`
    width: 100%;
    height: 100%;
    border-radius: 40px;
`

const PreviewImageBackground = styled.View`
    background-color: ${constants.SECONDARY_COLOR};
    width: 85%;
    height: 350px;
    border-radius: 40px;
    margin-top: 100px;
    justify-content: flex-end;
    align-items: center;
    padding-bottom: 5px;
`

const BackgroundCircle = styled.View`
    background-color: ${constants.PRIMARY_COLOR};
    height: 300px;
    width: 120%;
    border-bottom-left-radius: 400px;
    border-bottom-right-radius: 400px;
    position: absolute;
`

const ShadowView = styled.View`
    box-shadow: 0 0 25px black;
    width: 85%;
    height: 350px;
    border-radius: 40px;
    margin-top: -400px;
`

const ButtonHolder = styled.View`
    width: 100%;
    flex: 1;
    justify-content: flex-end;
    align-items: center;
    padding: 60px 30px;
`