import 'package:example_eriell/presentation/pages/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      color: CupertinoColors.activeBlue,
      home: SignInPage(),
    );
  }
}
