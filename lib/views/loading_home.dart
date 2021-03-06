import 'package:flutter/material.dart';
import 'package:ofa_v0/repositories.dart';

class LoadingHome extends StatefulWidget {
  @override
  _LoadingHome createState() => _LoadingHome();
}

class _LoadingHome extends State<LoadingHome> {
  void sendToOnboardingOrDashboard() async {
    INRepository inRepository = new INRepository();
    bool loaded = await inRepository.loadFromFS();

    if (loaded && inRepository.store.isNotEmpty) {
      Navigator.pushNamed(context, '/dashBoard', arguments: inRepository);
    } else {
      Navigator.pushNamed(context, '/onboarding');
    }
  }

  @override
  void initState() {
    super.initState();
    sendToOnboardingOrDashboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splash-dark2x.png'),
                fit: BoxFit.fitHeight),
          ),
          child: Center(
              child: Text(
            'loading',
            style: TextStyle(fontSize: 20),
          ))),
    );
  }
}
