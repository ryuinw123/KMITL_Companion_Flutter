import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:ui_base/ui/widgets/clipper_widget.dart';


class WaveWidget extends StatefulWidget {
  const WaveWidget({Key? key , required this.size , required this.yOffset , required this.color}) : super(key: key);

  final Size size;
  final double yOffset;
  final Color color;


  @override
  State<WaveWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {

  late AnimationController animationController;
  List<Offset> wavePoints = [];
  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this,duration: Duration(milliseconds: 5000))
    ..addListener(() {
      wavePoints.clear();
      double animationControllerValue = animationController.value;
      late final double waveSpeed;
      late final double fullSphere;
      late final double normalizer;
      final double waveWidth = Math.pi / 270;
      final double waveHeight = 20.0;

      if (animationControllerValue != null) {
        waveSpeed = animationControllerValue * 1080;
        fullSphere = animationControllerValue * Math.pi * 2 ;
        normalizer = Math.cos(fullSphere);

        for (int i = 0 ; i < widget.size.width.toInt(); ++i) {
          double calc = Math.sin((waveSpeed-i) * waveWidth);
          wavePoints.add(
            Offset(
                i.toDouble(),
                calc * waveHeight * normalizer + widget.yOffset,
            ),
          );
        }

      }

    });
    animationController.repeat();
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context , _) {
        return ClipPath(
          clipper: ClipperWidget(
            waveList: wavePoints,
          ),
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            color : widget.color,
          ),
        );
      },
    );
  }
}

