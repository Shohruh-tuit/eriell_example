import 'package:example_eriell/presentation/components/text_field_component.dart';
import 'package:example_eriell/presentation/routes/routes.dart';
import 'package:example_eriell/presentation/styles/app_style_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../application/auth_bloc/auth_bloc.dart';
import '../../services/user_data_model.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late Box<UserData> userBox;

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userBox = Hive.box('user_data');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text("Sign in"),
        ),
        // resizeToAvoidBottomInset: false,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.isSign) {
              Navigator.pushAndRemoveUntil(
                  context, Routes.hoemPage(), (route) => false);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // const Spacer(),
                  SizedBox(height: 50.h),
                  Column(
                    children: [
                      Image.asset("assets/images/ERIELL.png", height: 200.h),
                      TextFieldComponent(
                        text: "Login",
                        controller: _loginController,
                      ),
                      SizedBox(height: 10.h),
                      TextFieldComponent(
                        text: "Password",
                        controller: _passwordController,
                        isPassword: true,
                      ),
                      SizedBox(height: 30.h),
                      CupertinoButton(
                        color: const Color.fromARGB(255, 36, 89, 187),
                        onPressed: () {
                          _auth(context);
                        },
                        child: const Text('Sign In'),
                      ),
                    ],
                  ),
                  // const Spacer(),
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                            fontSize: 14.sp, color: CupertinoColors.black),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          Navigator.push(context, Routes.signUp());
                        },
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _auth(BuildContext context) {
    String userName = _loginController.text;
    String password = _passwordController.text;

    if (userName.isNotEmpty && password.isNotEmpty) {
      context.read<AuthBloc>().add(
            SignIn(
              login: userName,
              password: password,
            ),
          );
    } else {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          cancelButton: CupertinoButton(
            child: Text(
              "Cancel",
              style: TextStyle(fontSize: 18.sp),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Fill form',
            style: TextStyle(color: CupertinoColors.systemRed, fontSize: 18.sp),
          ),
        ),
      );
    }
  }
}
