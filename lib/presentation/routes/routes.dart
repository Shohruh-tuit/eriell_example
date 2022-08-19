import 'package:example_eriell/presentation/pages/home_page.dart';
import 'package:example_eriell/presentation/pages/sign_in_page.dart';
import 'package:example_eriell/presentation/pages/sign_up_page.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  Routes._();

  static PageRoute hoemPage() => CupertinoPageRoute(
        builder: (_) => const HomePage(),
      );

  static PageRoute signUp() => CupertinoPageRoute(
        builder: (_) => const SignUpPage(),
      );

  static PageRoute signIn(BuildContext context) => CupertinoPageRoute(
        builder: (_) => const SignInPage(),
      );
}
