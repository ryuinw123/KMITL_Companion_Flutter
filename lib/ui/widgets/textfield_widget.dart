
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_base/ui/shared/globals.dart';

import '../../core/viewmodels/home_model.dart';

class TextFieldWidget extends StatelessWidget {

  const TextFieldWidget({Key? key , this.hintText, this.prefixIconData, this.suffixIconData,
    required this.obscureText, this.onChanged }) : super(key: key);

  final String? hintText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final bool obscureText;
  final Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      style: const TextStyle(
        color: Global.mediumBlue,
        fontSize : 14.0,
      ),
      decoration: InputDecoration (
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size : 18,
          color : Colors.orange,
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Global.mediumBlue),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size : 18,
            color: Global.mediumBlue,
          ),
        ),
        labelStyle: const TextStyle(color: Global.mediumBlue),
        focusColor: Global.mediumBlue,

      ),
    );
  }
}
