import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.tealAccent,
                      Colors.redAccent,
                    ]),
              ),
              child: Center(
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: Image.asset(
                    'images/poor.jpg.jpg',
                  ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'I Am Poor',
              style: TextStyle(
                  fontSize: 30,
                  foreground: Paint()
                    ..shader = ui.Gradient.linear(
                        const Offset(180, 13), const Offset(150, 20), <Color>[
                      Colors.redAccent,
                      Colors.tealAccent,
                    ])),
            ),
            backgroundColor: Colors.black45,
          ),
        ),
      ),
    );

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 120);
    path.lineTo(size.width * 0.90, size.height);
    path.lineTo(size.width * 0.90, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
