import 'package:example_eriell/presentation/styles/app_style_library.dart';
import 'package:flutter/cupertino.dart';

class TextFieldComponent extends StatelessWidget {
  final String text;
  final bool isPassword;
  final TextEditingController controller;
  const TextFieldComponent({
    required this.text,
    this.isPassword = false,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: const Color.fromARGB(255, 230, 229, 229),
      ),
      child: Column(
        children: [
          CupertinoTextField(
            obscureText: isPassword,
            controller: controller,
            placeholder: "*",
            prefix: Text(
              "$text: ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: const BoxDecoration(),
          ),
        ],
      ),
    );
  }
}
