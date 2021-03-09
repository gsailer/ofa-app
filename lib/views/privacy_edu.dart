import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PrivacyEdu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff212121),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          );
        }),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF212121),
        ),
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            kToolbarHeight,
        child: Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.white,
            accentColor: Colors.white,
          ),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 6, top: 10),
                child: Text(
                  "Privacy precautions:",
                  style: TextStyle(
                    //TODO: change font to Russo One
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTileTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 6),
                child: ExpansionTile(
                  title: Text(
                    "Delete your data off of Facebook:",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "The most obvious thing to do is just to delete your data off of Facebook. Heres how to do it:",
                      ),
                    ),
                    ExpansionTile(
                      title: Text(
                        " • For app user:",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  text: 'Open up your Facebook app.\n',
                                  style:
                                      TextStyle(fontSize: 15, color: Colors.white),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            '1. Click on the search button in the top right corner.\n'),
                                    TextSpan(
                                      text:
                                          '2. Search for "Off-Facebook Activity"\n',
                                    ),
                                    TextSpan(
                                      text: '3. Click on Off-Facebook Activity\n',
                                    ),
                                    TextSpan(
                                      text: '4. Click on Clear History\n',
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        " • For website user:",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: 'Head over to the Facebook home page.\n',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        '1. Click on the drop down arrow in the top right corner.\n'),
                                TextSpan(
                                  text: '2. Click on Settings & Privacy.\n',
                                ),
                                TextSpan(
                                  text: '3. Click on Privacy Shortcuts\n',
                                ),
                                TextSpan(
                                  text:
                                      '4. View or clear your off-Facebook activity.\n',
                                ),
                                TextSpan(
                                  text: '5. Clear History"\n',
                                ),
                              ]),
                        ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
                indent: 8,
                endIndent: 8,
              ),
              ListTileTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 6),
                child: ExpansionTile(
                  title: Text(
                    "Don't use Facebook login:",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 13.0),
                      child: Text(
                          "This one is simple. Don't use the \"Login with Facebook\" feature. It might seem convenient, but enables Facebook to easily track your data."),
                    )
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
                indent: 8,
                endIndent: 8,
              ),
              ListTileTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 6),
                child: ExpansionTile(
                  title: Text(
                    "Limit third party sites and apps to share your data:",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text(
                        " • For app user:",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: 'Open up your Facebook app.\n',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        '1. Click on the search button in the top right corner.\n'),
                                TextSpan(
                                  text: '2. Search for "Apps and Websites"\n',
                                ),
                                TextSpan(
                                  text: '3. Click on Apps and Websites\n',
                                ),
                                TextSpan(
                                  text:
                                      '4. "Logged in with Facebook" shows you apps and websites you\'ve used Facebook to log into. There you can remove them from your account.\n',
                                ),
                              ]),
                        ),
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        " • For website user:",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: 'Head over to the Facebook home page.\n',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        '1. Click on the search button in the top left corner.\n'),
                                TextSpan(
                                  text: '2. Search for "Apps and Websites"\n',
                                ),
                                TextSpan(
                                  text: '3. Click on Apps and Websites\n',
                                ),
                                TextSpan(
                                  text:
                                      '4. This page shows you apps and websites you\'ve used Facebook to log into. There you can remove them from your account.\n',
                                ),
                              ]),
                        ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
                indent: 8,
                endIndent: 8,
              ),
              ListTileTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 6),
                child: ExpansionTile(
                  title: Text(
                    "Disable the apps or websites location tracking:",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text(
                        " • For app user:",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: 'Open up your Facebook app.\n',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        '1. Click on the search button in the top right corner.\n'),
                                TextSpan(
                                  text: '2. Search for "Location"\n',
                                ),
                                TextSpan(
                                  text: '3. Click on Location Settings\n',
                                ),
                                TextSpan(
                                  text:
                                      '4. Set "Turn on Location History for your mobile devices?" to "Off" if it isn\'t already\n',
                                ),
                                TextSpan(
                                  text:
                                      '5. You can also delete your location history under Location History while you\'re at it\n',
                                ),
                              ]),
                        ),
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        " • For website user:",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text: 'Head over to the Facebook home page.\n',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        '1. Click on the search button in the top left corner.\n'),
                                TextSpan(
                                  text: '2. Search for "Location"\n',
                                ),
                                TextSpan(
                                  text: '3. Click on Location Settings\n',
                                ),
                                TextSpan(
                                  text: '4. Click on Location Access\n',
                                ),
                                TextSpan(
                                  text:
                                      '5. Set "Turn on Location History for your mobile devices?" to "Off" if it isn\'t already\n',
                                ),
                                TextSpan(
                                  text:
                                      '6. You can also delete your location history under Location History while you\'re at it\n',
                                ),
                              ]),
                        ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
                indent: 8,
                endIndent: 8,
              ),
              ListTileTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 6),
                child: ExpansionTile(
                  title: Text(
                    "Use ad blocking extensions:",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child:Text(
                        "This is a tricky one and might require some computer knowledge, but it's totally worth it. You can install extentions for your browser or apps for your android smartphone that keep Facebook from tracking your data."),
                    ),
                    ExpansionTile(
                      title: Text(
                        " • For app user:",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child:RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text:
                                  'There is no universal tutorial to block Facebooks tracking on your smartphone. Especially on an iPhone. If you are still interested in blocking Facebook tracking on your android device I would recommend you have a look at Blockada.',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                              children: <TextSpan>[
                                TextSpan(text: '1. '),
                                TextSpan(
                                    text: 'Open ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                TextSpan(
                                    text: 'Account ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                TextSpan(
                                    text: 'tab\n\n',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                              ]),
                        ),
                          ),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(
                        " • For website user:",
                        style: TextStyle(color: Colors.white),
                      ),
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child:RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text:
                                  'Simple, head over to your Facebook app or visit the website.',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                              
                              children: <TextSpan>[
                                TextSpan(text: '1. '),
                                TextSpan(
                                    text: 'Open ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                TextSpan(
                                    text: 'Account ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                TextSpan(
                                    text: 'tab\n\n',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                              ]),
                        ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
                indent: 8,
                endIndent: 8,
              ),
              ListTileTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 6),
                child: ExpansionTile(
                  title: Text(
                    "Disable personalized ads:",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text(" • For app user:"),
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text:
                                  'Head over to your Facebook app or visit the website.',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: '1. '),
                                TextSpan(
                                    text: 'Open ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                TextSpan(
                                    text: 'Account ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                TextSpan(
                                    text: 'tab\n\n',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                              ]),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text(" • For website user:"),
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text:
                                  'Head over to your Facebook app or visit the website.',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: '1. '),
                                TextSpan(
                                    text: 'Open ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                TextSpan(
                                    text: 'Account ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                TextSpan(
                                    text: 'tab\n\n',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.white,
                indent: 8,
                endIndent: 8,
              ),
              ListTileTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: 6),
                child: ExpansionTile(
                  title: Text(
                    "WhatsApp, Instagram, etc.:",
                    style: TextStyle(color: Colors.white),
                  ),
                  children: <Widget>[
                    ExpansionTile(
                      title: Text("For app user:"),
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                              text:
                                  'Simple, head over to your Facebook app or visit the website.',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: '1. '),
                                TextSpan(
                                    text: 'Open ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                TextSpan(
                                    text: 'Account ',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                TextSpan(
                                    text: 'tab\n\n',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white)),
                              ]),
                        ),
                      ],
                    ),
                    ExpansionTile(
                      title: Text("For website user:"),
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text:
                                'Simple, head over to your Facebook app or visit the website.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: '1. '),
                              TextSpan(
                                  text: 'Open ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              TextSpan(
                                  text: 'Account ',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              TextSpan(
                                  text: 'tab\n\n',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
