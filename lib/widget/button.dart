import 'package:flutter/material.dart';
import 'package:covid19ethio/res/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final Widget widget;
  final double radius;
  final bool clear;

  Button(
      {this.text = '',
      this.color = Colors.deepOrange,
      this.onTap,
      this.widget = const Text(''),
      this.radius = 5.0,
      this.clear = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: clear ? null : 50.0,
      decoration: clear
          ? null
          : BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(radius),
              //boxShadow: ButtonStyle.boxShadow
            ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            child: Center(
                child: Padding(
              padding: clear
                  ? EdgeInsets.symmetric(horizontal: 2.0)
                  : EdgeInsets.symmetric(horizontal: 8.0),
              child: text == '' ? widget : Text(text),
            ))),
      ),
    );
  }
}
