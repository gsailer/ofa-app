import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // List<double> _heights = new List.unmodifiable([350.0, 350.0, 810.0, 670.0]);
  List<double> _heights = new List.unmodifiable([0.4, 0.4, 0.95, 0.8]);

  double _pageViewHeight = 0.4;
  List<String> _buttonText = new List.unmodifiable([
    "Yes!",
    "Let's find out!",
    "Done, next!",
    "Upload your Facebook data archive"
  ]);

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

  Widget _button(int page) {
    return ElevatedButton(
      onPressed: () {
        _pageController.nextPage(
            duration: Duration(milliseconds: 100), curve: Curves.easeIn);
      },
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFE93A68),
      ),
      child: Text(_buttonText[page]),
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
          child: ListView(children: <Widget>[
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
                horizontal: 25,
              ),
              child: Container(
                //TODO: auto adjust height depending on pageview size so on "download your data"-page the buttons move down"
                height: MediaQuery.of(context).size.height * _pageViewHeight,
                // width: MediaQuery.of(context).size.width * 1,

                // child: SizedBox(
                // height: _SizeReportingWidgetState.
                child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                        _pageViewHeight = _heights[page];
                      });
                    },
                    children: <Widget>[
                      // onChange: () {

                      // },
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 60),
                            child: Image(
                              image: AssetImage('assets/icons/data2x.png'),
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Let's get started",
                                style: TextStyle(
                                  //TODO: change font to Russo One
                                  fontSize: 30,
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
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 60),
                            child: Image(
                              image: AssetImage('assets/icons/books2x.png'),
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Get insights",
                                style: TextStyle(
                                  //TODO: change font to Russo One
                                  fontSize: 30,
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
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        // padding: EdgeInsets.all(20),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              child: Text(
                                "Download your data",
                                style: TextStyle(
                                  //TODO: change font to Russo One
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                                image: AssetImage(
                              'assets/images/json_tutorial.gif',
                            )),
                          ),
                        ],
                      ),

                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              child: Text(
                                "Import your data here",
                                style: TextStyle(
                                  //TODO: change font to Russo One
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 600,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Color(0x1EE93A68),
                                  border: Border.all(
                                    color: Color(0xFFE93A68),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Opacity(
                                    opacity: 0.4,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/upload_icon.png')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 15.0,
                                      bottom: 60,
                                    ),
                                    child: Container(
                                      width: 200,
                                      child: ElevatedButton(
                                        onPressed: () => {
                                          Navigator.pushNamed(
                                              context, '/loadingJSON'),
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFE93A68),
                                          elevation: 12,
                                        ),
                                        child: Text(_buttonText[3]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),

            if (_currentPage != 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_button(_currentPage)],
              ),
            Container(
              child: Image(
                image: AssetImage('assets/icons/onboarding-footer.png'),
              ),
            )

            // if (_currentPage == 0)
            //   Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         ElevatedButton(
            //           onPressed: () {
            //             _pageController.nextPage(
            //                 duration: Duration(milliseconds: 1000),
            //                 curve: Curves.ease);
            //           },
            //           child: Text("Yes!"),
            //         ),
            //       ])
            // else if (_currentPage == 1)
            //   Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         ElevatedButton(
            //           onPressed: () {
            //             _pageController.nextPage(
            //                 duration: Duration(milliseconds: 1000),
            //                 curve: Curves.decelerate);
            //           },
            //           child: Text("Let's find out!"),
            //         )
            //       ])
            // else if (_currentPage == 2)
            //   Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         ElevatedButton(
            //           onPressed: () {
            //             _pageController.nextPage(
            //                 duration: Duration(milliseconds: 1000),
            //                 curve: Curves.decelerate);
            //           },
            //           child: Text("Done, next!"),
            //         )
            //       ]),
          ]),
        ),
      ),
    );
  }
}

// class SizeReportingWidget extends StatefulWidget {
//   final Widget child;
//   final ValueChanged<Size> onChange;

//   const SizeReportingWidget({
//     Key key,
//     @required this.child,
//     @required this.onChange,
//   }) : super(key: key);

//   @override
//   _SizeReportingWidgetState createState() => _SizeReportingWidgetState();
// }

// class _SizeReportingWidgetState extends State<SizeReportingWidget> {

//   Size _oldSize;

//   @override Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((_) => _reportSize());
//     return widget.child;
//   }

//   void _reportSize() {
//     final size = context.size;
//     if (_oldSize != size) {
//       _oldSize = size;
//       widget.onChange(size);
//     }
//   }
// }
