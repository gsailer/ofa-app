# Cross-plaform vs Old/New Native approach for development

* Status: accepted
* Deciders: Dominik Prediger, Gabriel Sailer
* Date: 2020-12-06

Technical Story: Technical implementation of the app

## Context and Problem Statement

Do we want to limit portability of the app to Android?
What language should be used?

## Decision Drivers

* Ease of implementation
* Availability of libs
* Stability
* Market popularity
* Portability between ecosystems
* Learning curve


## Considered Options

* Java
* Kotlin
* React Native JS
* Flutter

## Decision Outcome


Chosen option: Flutter, because quick prototyping showed better ease of use with external libs over React Native, apart from that head-to-head. Coming up to personal preference.


## Pros and Cons of the Options

### [Java]

Old-Native Android option

* Good, because large amount of available libs
* Good, because there are lots of examples available
* Bad, because of slow development through overhead
* Bad, because of missing iOS support
* Bad, because of high archtecture requierements

### [Kotlin]

New-Native Android option

* Good, because less boilerplate than Java
* Good, because quicker compilation times than Java
* Good, because institute uses it
* Bad, because of slower development experience
* Bad, because of missing iOS support
* Bad, because of high architecture requierements
* Bad, because of high learning curve compared to the other languages


### [React Native]

Cross-platform based on popular framework

* Good, because hot reloading support
* Good, because availability of many npm libs
* Good, because JS knowlege exists at the institute and with students
* Good, because of greater professional user base than Flutter
* Bad, because code might break with release of RN >1.0.0
* Bad, because of lower performance
* Bad, because of npm native package complexity (learned during prototype)

### [Flutter]

Cross-platform UI-toolkit by Google

* Good, because of better cross-platform ui components
* Good, because hot reloading support
* Good, because up and coming technology by Google
* Good, because of one-time effort for Android and iOS
* Bad, because fewer libs than in the js ecosystem
* Bad, because of relative immaturity

## Links

[Stackoverflow Survey 2020](https://insights.stackoverflow.com/survey/2020)
[Migration Story Reflectly](https://medium.com/reflectly-engineering/reflectly-from-react-native-to-flutter-2e3dffced2ea)
