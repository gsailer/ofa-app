# [Cross-plaform vs Old/New Native approach for development]

* Status: postponed
* Deciders: Dominik Prediger, Gabriel Sailer
* Date: 2020-11-30

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
* React Native Typescript
* Flutter

## Decision Outcome

Posponed until result of prototype performance between Flutter and RN is clear.

Chosen option: "[option 1]", because [justification. e.g., only option, which meets k.o. criterion decision driver | which resolves force force | … | comes out best (see below)].


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
* Good, because of one-time effort for Android and iOS
* Good, because JS knowlege exists at the institute and with students
* Good, because types allow for more explict code when using TypeScript
* Good, because of greater professional user base than Flutter
* Bad, because code might break with release of RN >1.0.0
* Bad, because of lower performance


### [Flutter]

Cross-platform UI-toolkit by Google

* Good, because hot reloading support
* Good, because up and coming technology by Google
* Good, because of one-time effort for Android and iOS
* Bad, because fewer libs than in the js ecosystem
* Bad, because of relative immaturity
* Bad, because of low user rate according to Stackoverflow

## Links

[Stackoverflow Survey 2020](https://insights.stackoverflow.com/survey/2020)