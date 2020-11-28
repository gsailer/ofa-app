# Requirements

## Motivation
Since most Facebook users do not know that they are tracked outside of Facebook, we want to enable every user to easily understand the impact of their data promiscuity.

We do this by increasing awareness of their third-party data collection through easy to understand visualisation of data provided by "Off-Facebook Activity" data exports.

Further we educate on possible protection measures  for their targeted ad data applicable for every Facebook user independent of technical knowledge.

## Usage
The app is primarily supposed to be used within studies executed by the Institute Security, Usability and Society of the Karlsruhe Institute of Technology.
It will also be available for general usage by curious persons with all kinds of technical backgrounds through App Platform downloads.

## Personas

### Thilo
- Age: 17
- Hobbys: playing football, watching Game of Thrones, hanging out with friends
- Technical background: Uses smartphone daily, uses computer for basic school homework.
- Backgroud: Grew up in a regular neighborhood, his parents have nothing to do with
    IT and neither does he.
- Privacy awareness: Does not think about his IT Privacy. Probably does not even know that,
    how and why Facebook captures his data. 

### Brigitte
- Age: 78
- Hobbys: reading, knitting, baking cakes for her grandchildren
- Technical Background: Uses smartphone her children set up for her to communicate
with her family and exchange recipies for cakes on Facebook
- Background: Grew up in the GDR under Stasi surveillance
- Privacy Awareness: Is highly aware of state surveillance, but does not understand Facebook data collection extent

### Clark
- Age: 42
- Hobbys: Golfing, Collecting model cars, sending unfunny memes
- Technical Background: works with computers at his job since the 90s
- Background: Lives in a suburb, works for a corp in accounting
- Privacy Awareness: Knows about data collection on a superfical level, but doesn't care

### Annabelle
- Age: 28
- Hobbys: Programming, Hacking, volunteering at political orgs
- Technical background: Grew up with computers and studied computer science.
- Backgroud: Grew up with older siblings who introduced her into computers. Parents are very IT aware aswell.
- Privacy awareness: Knows of data privacy problems and can comprehend the impact of data collection fully.

## Functional
- The app must be able to load off-facebook activity data from the local filesystem in a json fromat
- The app should explain the user how to get this json file from Facebook and import it (Onboarding).
- The app must be able to create digests from the data
- The app may be able to create inferences on user behaviour based on the data
- The app should explain the user what data privacy measures can be applied
- The app should allow the deletion of local data
- The app should cache once loaded json data for future uses
- The app should display the number of websites/apps providing data to Facebook
- The app should allow user to filter his data by date or frequency (or type?)
- The app should motivate the user to apply data privacy measures
- The app should give user feedback about loading times
- The app should provide the user overview on where he is


## Non-Functional
!!TODO: check study on load time perception
- The app json load time must be lower than 6s
- The user should not have to decipher raw event names/types, but should have the possibility to inspect details anyway (e.g. for Annabelle)
- If the app has cached user activity data the load time should be lower than 4s
- The app should store the json and other relevant data locally
- The app should have minimal and only necessary permissions

## Technical
- Filesytem Access
- Deployment of App to App Platforms for download
- Available open source lib for visualization
- Access to app-local storage

## Links
[JSON load times in v8](https://v8.dev/blog/cost-of-javascript-2019#json)
