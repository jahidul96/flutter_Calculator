import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final buttonColor;
  final textColor;
  final tap;
  const MyButton(
      {super.key,
      required this.buttonText,
      this.buttonColor,
      this.textColor,
      this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
              color: buttonColor,
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ),
    );
  }
}
