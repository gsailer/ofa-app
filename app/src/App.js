import 'react-native-gesture-handler';
import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createStackNavigator} from '@react-navigation/stack';

import LoadDataScreen from './screens/LoadDataScreen';
import DataOverviewScreen from './screens/DataOverviewScreen';

const Stack = createStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Load Data">
        <Stack.Screen name="Load Data" component={LoadDataScreen} />
        <Stack.Screen
          name="Data Overview"
          component={DataOverviewScreen}
          initialParams={{
            numOfEvents: [{name: 'NoEventsThereYet', numOfEvents: 42}],
          }}
        />
      </Stack.Navigator>
    </NavigationContainer>
  );
};

export default App;
