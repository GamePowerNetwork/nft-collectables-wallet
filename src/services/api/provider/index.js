import AsyncStorage from '@react-native-async-storage/async-storage';

export default {
  addProvider: async (providers) => {
    try {
      const jsonValue = JSON.stringify(providers)
      await AsyncStorage.setItem('@providers', jsonValue)

      return true
    } catch (e) {
      // saving error
      throw(e)
    }
  }
}