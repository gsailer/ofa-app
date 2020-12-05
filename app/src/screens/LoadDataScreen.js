import React from 'react';

import {View, Button, Text} from 'react-native';

import {styles} from '../styles';
import DocumentPicker from 'react-native-document-picker';
import * as RNFS from 'react-native-fs';

const transformToTable = (text, navigation) => {
  let sites = JSON.parse(text).off_facebook_activity;
  let numOfEvents = sites.map((site) => {
    return {name: site.name, numOfEvents: site.events.length};
  });
  navigation.navigate('Data Overview', {numberOfEvents: numOfEvents});
};

const loadJSON = async (navigation) => {
  try {
    const res = await DocumentPicker.pick({
      type: [DocumentPicker.types.allFiles],
    });
    if (res.type === 'application/json') {
      RNFS.readFile(res.uri, 'utf8')
        .then((content) => {
          transformToTable(content, navigation);
        })
        .catch((err) => {
          console.log(err.message, err.code);
        });
    } else {
      // TODO: replace alert with regular popup dialog
      alert('Did you pick the correct file?\nPlease supply a JSON file.'); // eslint-disable-line no-alert
      console.log("ABORT: Didn't get json");
    }
  } catch (err) {
    if (DocumentPicker.isCancel(err)) {
      // User cancelled the picker, exit any dialogs or menus and move on
    } else {
      throw err;
    }
  }
};

const LoadDataScreen = ({navigation}) => {
  return (
    <View style={styles.body}>
      <View style={styles.sectionContainer}>
        <Text style={styles.sectionTitle}>
          Select off-facebook-activity json
        </Text>
        <Text style={styles.sectionDescription}>
          Please select your{' '}
          <Text style={styles.highlight}>off_facebook-activity.json</Text> you
          downloaded from Facebook.
        </Text>
        <Button
          onPress={() => loadJSON(navigation)}
          title="Load data"
          accessibilityLabel="Load your Facebook data from your device"
        />
      </View>
    </View>
  );
};

export default LoadDataScreen;
