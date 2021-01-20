import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _indicatorWidget() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOutSine,
      height: 13,
      width: 13,
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          color: isActive ? Colors.white : Color(0xFF212121),
          border: Border.all(width: 1, color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF212121),
          ),

          child: Column(
            children: <Widget>[

              Padding(
                //TODO: + offset to notificationbar?
                padding: EdgeInsets.only(
                  top: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _indicatorWidget(),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 0),

                child: Container(
                  //TODO: auto adjust height depending on pageview size so on "download your data"- page the buttons move down"
                  height: 320,
                  width: MediaQuery.of(context).size.width * 0.8,

                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                         _currentPage = page;
                      });
                    },

                    children: <Widget>[
                      Column(

                        children: <Widget>[

                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 60
                            ),
                            child: Image(
                              image: AssetImage(
                                'assets/images/3_todo.png'
                              ),
                              width: 100,
                              height: 100,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Let's get started",
                                style: TextStyle(
                                  //TODO: change font to Russo One
                                  fontSize: 24,
                                  color: Colors.white,
                                  // decorationStyle: 
                              ),
                            ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Curious to find out what Facebook knows \nabout your surfing behaviour?",
                              style: TextStyle(
                                //TODO: change font to Russo One
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(

                        children: <Widget>[

                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 60
                            ),
                            child: Image(
                              image: AssetImage(
                                'assets/images/3_todo.png'
                              ),
                              width: 100,
                              height: 100,
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Get insights",
                                style: TextStyle(
                                  //TODO: change font to Russo One
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Find out, what could be learned from \nyour data.",
                              style: TextStyle(
                                //TODO: change font to Russo One
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),              
                        ],
                      )
                    ]
                  ),
                ),
              ),

              if (_currentPage == 0) 
                Row( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 1000), 
                            curve: Curves.ease);
                        }, 
                        child: Text("Yes!"),
                      ),
                    
                  ] 
                )
              
              else if (_currentPage == 1)
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 1000), 
                          curve: Curves.decelerate);
                      }, 
                      child: Text("Let's find out!"),
                    )
                    ]
                    
                  ),
                
              
              // else if (_currentPage == 1) {

              // } else if (_currentPage == 2) {

              // } else {

              // }


              
          ]),
        ),
      ),
    );
  }
}
