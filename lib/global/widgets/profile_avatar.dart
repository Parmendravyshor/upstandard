import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';
import 'dart:ui' as ui;

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double avatarRadius;
  final double width;

  const ProfileAvatar({Key key,@required this.imageUrl , @required this.avatarRadius, @required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      
      alignment: Alignment.center,
      height: avatarRadius,
      width: width,
      // color: MyTheme.red,
      child:Stack(
        children: [
          Positioned(
            // alignment: Alignment.topLeft,
            bottom: 10,
            left: 20,
            child: Container(
              width: 20,
              height: 20,
              child: CustomPaint(
                painter: MakeCircle(
                  color: MyTheme.orange,
                  radius: 15
                ),
              ),
            ),
          ),
         Positioned(
            // alignment: Alignment.topLeft,
            top: 20,
            right: 10,
            child: Container(
              width: 20,
              height: 20,
              child: CustomPaint(
                painter: MakeCircle(
                  color: MyTheme.orange,
                  radius: 20
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child:  Container(
              height: avatarRadius,
              width: avatarRadius,
              decoration: BoxDecoration(
              
                shape: BoxShape.circle,
                border: Border.all(color: MyTheme.white,width: 1),
                image: DecorationImage(
                  image:AssetImage(imageUrl),
                  //  NetworkImage(imageUrl),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),
          
           
            Positioned(
            // alignment: Alignment.centerRight,
            top: 40,
            right: 0,
            child: Container(
              width: 20,
              height: 20,
              child: CustomPaint(
                painter: MakeCircle(
                  color:  Color(0xffFFC938).withOpacity(0.6),
                  radius: 13
                ),
              ),
            ),
          ),
          
        ],
      )
    );
  }
}


class MakeCircle extends CustomPainter {
  final Color color;
  final double radius;

  MakeCircle({this.color, this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    var position = Offset(size.width /10, size.height / 10);
    canvas.drawCircle(position, radius, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


class GradientCircle extends CustomPainter {
  final Color color;
  final double radius;

  GradientCircle({this.color, this.radius});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = color;
    paint.shader = ui.Gradient.linear(
      Offset(0,1),
       Offset(1,0),
      [
        MyTheme.orange,
        MyTheme.primaryColor,
      ],
  );
    var position = Offset(size.width /10, size.height / 10);
    canvas.drawCircle(position, radius, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}






class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xff63aa65)
      ..style = PaintingStyle.fill;
    //a circle
    canvas.drawCircle(Offset(200, 200), 100, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}