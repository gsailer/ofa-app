# OFA App

Since most Facebook users do not know that they are tracked outside of Facebook, we want to enable every user to easily understand the impact of their data promiscuity.

This app visualises Off-Facebook activity data resulting from data exports [Off-Facebook Activity](https://www.facebook.com/help/2207256696182627).
This app is supposed to be used in the context of research of the KIT.

## Getting Started

To install this app on Android you can go to the releases on github and download the unsigned apk there.
Your android device will complain that the apk is not signed, which you have to ignore for now.
After installation the app should be available and will guide you through an onboarding on how to get your data from Facebook.

## Building the app on your own

To build the app you need to install the Flutter tools from [flutter.dev](https://flutter.dev/docs/get-started/install).
After an sucessful setup you should be able to install all requirements through `flutter pub get`, build or run the app by `flutter build|run` or also run tests `flutter test`.

If you want to add new functionality like providing inferences on the user data, you should have a look at the [architecture](docs/architecture.md).

## Making a new release

To initiate a new release push all your changes and create a new (annotated) git tag on master.
After the successful push of the tag the Github Actions workflow will build and prepare a new release with the apk.