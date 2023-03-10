import 'package:flutter/material.dart';
import 'package:auth_socmed/app/data/size.dart';

class SocmedOptionButtonLogin extends StatelessWidget {
  const SocmedOptionButtonLogin({
    super.key,
    required this.ontapButton,
    required this.iconPath,
    required this.labelTxt,
  });

  final Function ontapButton;
  final String iconPath, labelTxt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontapButton(),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: parameterGLobal.defaultMargin,
          vertical: parameterGLobal.defaultMargin / 4,
        ),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              parameterGLobal.defaultBorder,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              iconPath,
              width: 25.0,
              height: 25.0,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: parameterGLobal.defaultMargin,
            ),
            Text(
              labelTxt,
              style: TextStyle(
                fontSize: parameterGLobal.sizeFontMedium,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
