 import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';

class PopButton extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Positioned(
      top: 32,
      // left: 20,
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios,
         color: MyTheme.black, size: 30,),
        onPressed: () { 
          Navigator.pop(context);
         },

      ),
    );
   }
 }
 