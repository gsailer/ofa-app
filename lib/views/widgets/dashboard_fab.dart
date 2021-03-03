import 'package:flutter/material.dart';

// A custom FloatingActionButton with animation when toggled.
// This was adapted from a post from Agung Surya on May 31, 2018 to the medium.com website: 
// https://medium.com/@agungsurya/create-a-simple-animated-floatingactionbutton-in-flutter-2d24f37cfbcc

class DashBoardFAB extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;
  final Object heroTag;

  DashBoardFAB({this.onPressed, this.tooltip, this.icon, this.heroTag});

  @override
  _DashBoardFABState createState() => _DashBoardFABState();
}

class _DashBoardFABState extends State<DashBoardFAB>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 400;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    // _buttonColor = Colors.black,
    // ColorTween(
    //   begin: Colors.blue,
    //   end: Colors.red,
    // ).animate(CurvedAnimation(
    //   parent: _animationController,
    //   curve: Interval(
    //     0.00,
    //     1.00,
    //     curve: Curves.linear,
    //   ),
    // ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget delete() {
    return Container(
      child: FloatingActionButton.extended(
        splashColor: Colors.white,
        backgroundColor: Color(0xFFECB02D),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/delete_confirm');
        },
        tooltip: 'Image',
        icon: Icon(Icons.delete),
        heroTag: "26342516",
        label: Text("Delete data from app"),
      ),
    );
  }

  Widget load() {
    return Container(
      child: FloatingActionButton.extended(
        
        splashColor: Colors.white,
        backgroundColor: Color(0xFFECB02D),
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/onboarding'));
        },
        tooltip: 'Inbox',
        icon: Icon(Icons.refresh),
        heroTag: "37432513",
        label: Text("Load new data"),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(  
        splashColor: Colors.white,
        backgroundColor: Color(0xFFE93A68),
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      heroTag: "43451667",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value,
            -14 * 2.0,
            0.0,
          ),
          child: delete(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            _translateButton.value,
            -14,
            0.0,
          ),
          child: load(),
        ),
        toggle(),
      ],
    );
  }
}