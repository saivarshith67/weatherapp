import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlassWidget extends StatelessWidget {
  final double height;
  final double width;

  FrostedGlassWidget({
    this.width = 100,
    this.height = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ClipRect(
        child: Container(
          width: 150,
          height: 75,
          color: Colors.transparent,
          child: Stack(
            children: [
              //blur effect
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(),
              ),
              //gradient effect
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(color: Colors.white.withOpacity(0.13)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.35),
                          Colors.white.withOpacity(0.15),
                        ])),
              ),
              //child
            ],
          ),
        ),
      ),
    );
  }
}
