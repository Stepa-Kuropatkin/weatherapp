import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/screens/homescreen.dart';

class Opacityanimate extends StatefulWidget {
  Opacityanimate({Key key}) : super(key: key);

  @override
  _OpacityanimateState createState() => _OpacityanimateState();
}

class _OpacityanimateState extends State<Opacityanimate> {
  Tween<double> tween = Tween(begin: 0.0, end: 1.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: tween,
        duration: Duration(seconds: 4),
        builder: (BuildContext context, double opacity, Widget child) {
          return Opacity(
            opacity: opacity,
            child: CircularProgressIndicator(),
          );
        },
        onEnd: () {
          Get.off(Homescreen());
        },
      ),
    );
  }
}
