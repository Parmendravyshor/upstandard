import 'package:flutter/material.dart';

class RoundedBorderTextButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final double height;
  final double width;
  final Color textColor;
  final Color bgColor;
  final double  fontSize;
  final double  borderRadius ;
  final Color borderColor;

  const RoundedBorderTextButton({Key key, 
  @required this.title, @required this.onTap, @required this.height,
  @required this.width, @required this.textColor, @required this.bgColor,
   this.fontSize,  @required this.borderRadius,  @required this.borderColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height:height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: bgColor,
          border: Border.all(color:borderColor )
        ),
        child: Text(title,
        style: TextStyle(
          fontSize:  fontSize ,
          fontWeight: FontWeight.bold,
          color:textColor),
        )
      ),
    );
  }
}

class RoundedBorderTextIconButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final double height;
  final double width;
  final Color textColor;
  final Color bgColor;
  final double  fontSize;
  final double  borderRadius ;
  final Color borderColor;
  final String iconAsset;
  final Color iconColor;

  const RoundedBorderTextIconButton({Key key, 
  @required this.title, @required this.onTap, @required this.height,
  @required this.width, @required this.textColor, @required this.bgColor,
   this.fontSize,  @required this.borderRadius, @required this.iconColor,
   @required this.iconAsset, @required this.borderColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height:height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: bgColor,
          border: Border.all(color:borderColor )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
            style: TextStyle(
              fontSize:  fontSize ,
              fontWeight: FontWeight.bold,
              color:textColor),
            ),
            SizedBox(width:15),
            Image.asset(iconAsset,
            color: iconColor,
            height: 25, width: 25,)
          ],
        )
      ),
    );
  }
}







class CircularButton extends StatelessWidget {
  final void Function() onTap;
  final double buttonRadius ;
  final Color buttonBgColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;


  const CircularButton({Key key, 
  this.onTap, this.buttonRadius, 
  this.buttonBgColor,
   this.icon, this.iconColor, this.iconSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        alignment: Alignment.center,
        height: buttonRadius,
        width: buttonRadius,
        decoration: BoxDecoration(
          color: buttonBgColor,
          shape: BoxShape.circle,

        ),
        child: Icon(
          icon,
          size: iconSize,
         color: iconColor,),


        
      ),
    );
  }
}