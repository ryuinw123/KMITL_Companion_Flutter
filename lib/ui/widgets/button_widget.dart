import 'package:flutter/material.dart';
import 'package:ui_base/ui/shared/globals.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key , required this.title , this.hasBorder = false }) : super(key: key);

  final String title;
  final bool hasBorder;





  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Global.white : Global.mediumBlue,
          borderRadius: BorderRadius.circular(10),
          border : hasBorder
            ? Border.all(
            color : Global.mediumBlue,
            width: 1.0,
          )
              :const Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 60.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder ? Global.mediumBlue : Global.white,
                  fontWeight: FontWeight.w600,
                  fontSize : 16.0,

                ) ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
