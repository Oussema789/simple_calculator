import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final color;
  final textcolor;
  final buttontab;
  final String? textbutton;

  MyButton(
      {Key? key, this.color, this.textbutton, this.textcolor, this.buttontab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontab,
      child:   Padding(
        padding: const EdgeInsets.all(7.0),
        child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      spreadRadius: 5,

                      offset: const Offset(2, 5), // changes position of shadow
                    ),
                  ],
                ),

                  child: Center(
                    child: Text(
                      textbutton!,
                      style:  GoogleFonts.bungee(
                        color: color,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,

                      ),

                    ),
                  )
              ),
      )


    );
  }
}
