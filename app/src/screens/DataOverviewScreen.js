import React from 'react';
import {Text, FlatList, View} from 'react-native';
import ListItem from '../components/ListItem';
import {styles} from '../styles';

const DataOverviewScreen = ({route}) => {
  const {numberOfEvents} = route.params;
  return (
    <View style={styles.body}>
      <View style={styles.sectionContainer}>
        <Text style={styles.sectionTitle}>Top Emmitents of your data</Text>
        <FlatList
          data={numberOfEvents.sort((a, b) => b.numOfEvents - a.numOfEvents)}
          renderItem={(item) => (
            <View>
              <ListItem
                name={item.item.name}
                numOfEvents={item.item.numOfEvents}
              />
            </View>
          )}
          keyExtractor={(item) => item.name}
        />
      </View>
    </View>
  );
};

export default DataOverviewScreen;
