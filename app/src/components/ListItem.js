import React from 'react';
import {Text, View} from 'react-native';

import {ListItemStyles as styles} from '../styles/ListItemStyle';

const ListItem = (props) => {
  const {name, numOfEvents} = props;
  return (
    <View style={styles.view}>
      <Text>{numOfEvents} Events</Text>
      <Text style={styles.text}>{name}</Text>
    </View>
  );
};

export default ListItem;
