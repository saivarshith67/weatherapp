import 'dart:ui';
import 'colours.dart';
import 'package:flutter/material.dart';


class FrostedGlassWidget extends StatelessWidget{
  // final Widget child;

  // FrostedGlassWidget({super.key, required this.child});



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      child: ClipRect(

        child: Container(
          width: 100,
          height: 150,
          color: Colors.transparent,
          child: Stack(
            children: [
              //blur effect
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
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
                      Colors.white.withOpacity(0.25),
                      Colors.white.withOpacity(0.15),
                    ]
                  )
                ),
              ),
              //child
            ],
          ),
        ),
      ),
    )

    ;
  }

}