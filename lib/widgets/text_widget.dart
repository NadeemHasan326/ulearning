import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  const TextWidget({super.key, required this.text,required this.textStyle,this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text!,textAlign: textAlign,style: textStyle,);
  }
}
