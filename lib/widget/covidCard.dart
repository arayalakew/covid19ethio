import 'package:flutter/material.dart';

class CovidCard extends StatelessWidget {
  final Widget child;
  final double padding;
  final VoidCallback onTap;

  CovidCard({this.child, this.padding = 16.0, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cardPadding = EdgeInsets.all(padding);

    return Container(
      width: double.infinity,
      //decoration: DecoCardStyle.decoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            //borderRadius: DecoCardStyle.borderRadius,
            child: Container(
              color: Colors.transparent,
              padding: cardPadding,
              child: getChild(),
            )),
      ),
    );
  }

  Widget getChild() {
    return child == null ? Container() : child;
  }
}
