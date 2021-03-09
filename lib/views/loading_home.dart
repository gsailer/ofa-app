import 'package:flutter/material.dart';
import 'package:ofa_v0/repositories.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class LoadingHome extends StatefulWidget {
  @override
  _LoadingHome createState() => _LoadingHome();
}

class _LoadingHome extends State<LoadingHome> {
  void sendToOnboardingOrDashboard() async {
    if (kIsWeb) {
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else {
      INRepository inRepository = new INRepository();
      bool loaded = await inRepository.loadFromFS();

      if (loaded && inRepository.store.isNotEmpty) {
        Navigator.pushReplacementNamed(context, '/dashBoard',
            arguments: inRepository);
      } else {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
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
      ),
    );
  }
}
