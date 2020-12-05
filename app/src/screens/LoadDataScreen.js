import React from 'react';

import {
  SafeAreaView,
  ScrollView,
  View,
  Button,
  Text,
  StatusBar,
} from 'react-native';

import {styles} from '../styles';
import DocumentPicker from 'react-native-document-picker';
import * as RNFS from 'react-native-fs';

const writeToTable = (text) => {
  let sites = JSON.parse(text).off_facebook_activity.map((site) => site.name);
  console.log(sites);
};

const loadJSON = async () => {
  try {
    const res = await DocumentPicker.pick({
      type: [DocumentPicker.types.allFiles],
    });
    if (res.type === 'application/json') {
      RNFS.readFile(res.uri, 'utf8')
        .then((content) => {
          writeToTable(content);
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

const LoadDataScreen = () => {
  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <ScrollView
          contentInsetAdjustmentBehavior="automatic"
          style={styles.scrollView}>
          {global.HermesInternal == null ? null : (
            <View style={styles.engine}>
              <Text style={styles.footer}>Engine: Hermes</Text>
            </View>
          )}
          <View style={styles.body}>
            <View style={styles.sectionContainer}>
              <Text style={styles.sectionTitle}>
                Select off-facebook-activity json
              </Text>
              <Text style={styles.sectionDescription}>
                Please select your{' '}
                <Text style={styles.highlight}>off_facebook-activity.json</Text>{' '}
                you downloaded from Facebook.
              </Text>
              <Button
                onPress={loadJSON}
                title="Load data"
                accessibilityLabel="Load your Facebook data from your device"
              />
            </View>
          </View>
        </ScrollView>
      </SafeAreaView>
    </>
  );
};

export default LoadDataScreen;
