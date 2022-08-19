import 'package:example_eriell/application/auth_bloc/auth_bloc.dart';
import 'package:example_eriell/presentation/components/text_field_component.dart';
import 'package:example_eriell/presentation/routes/routes.dart';
import 'package:example_eriell/presentation/styles/app_style_library.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final loginController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text("Sign Up"),
          ),
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              print("STATE ${state.isLogged}");
              if (state.isLogged) {
                Navigator.pushAndRemoveUntil(
                    context, Routes.signIn(context), (route) => false);
              } else if (state.hasError) {
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
                      state.error,
                      style: TextStyle(
                          color: CupertinoColors.systemRed, fontSize: 18.sp),
                    ),
                  ),
                );
              }
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextFieldComponent(
                            text: "Login",
                            controller: loginController,
                          ),
                          SizedBox(height: 10.h),
                          TextFieldComponent(
                            text: "Name",
                            controller: nameController,
                          ),
                          SizedBox(height: 10.h),
                          TextFieldComponent(
                            text: "Last name",
                            controller: lastNameController,
                          ),
                          SizedBox(height: 10.h),
                          TextFieldComponent(
                            text: "Password",
                            controller: passwordController,
                            isPassword: true,
                          ),
                          SizedBox(height: 10.h),
                          TextFieldComponent(
                            text: "Confirm password",
                            controller: confirmPasswordConroller,
                            isPassword: true,
                          ),
                          SizedBox(height: 30.h),
                          CupertinoButton(
                            color: const Color.fromARGB(255, 36, 89, 187),
                            onPressed: () {
                              _signUp(context);
                            },
                            child: const Text('Sign up'),
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      Row(
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 14.sp, color: CupertinoColors.black),
                          ),
                          CupertinoButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context,
                                  Routes.signIn(context), (route) => false);
                            },
                            child: const Text('Sign in'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  void _signUp(BuildContext context) {
    if (loginController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordConroller.text.isNotEmpty) {
      if (passwordController.text == confirmPasswordConroller.text) {
        print("Fefe");
        context.read<AuthBloc>().add(
              SignUp(
                login: loginController.text,
                name: nameController.text,
                lastName: lastNameController.text,
                password: passwordController.text,
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
              'Password does not match',
              style:
                  TextStyle(color: CupertinoColors.systemRed, fontSize: 18.sp),
            ),
          ),
        );
      }
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
