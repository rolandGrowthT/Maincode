import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.fixed,
        content: Container(
          margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom-100,
        top: 30,),
          decoration: BoxDecoration(
            color: Color(0xFFEAD5D8),
            border: Border.all(
              width: 0.7,
              color: Color(0xFFAE2D3C),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
                child: SvgPicture.asset(
                  'assets/icons/Group 11801.svg',
                  width: 26,
                  height: 26,
                  color: Color(0xFFAE2D3C),
                ),
              ),
              SizedBox(width: 2),
              Padding(
                padding: const EdgeInsets.fromLTRB(56, 0, 0, 0),
                child: Text(
                  message,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFAE2D3C),
                    fontFamily: 'MontserratMedium',
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
