import 'package:flutter/material.dart';
import 'package:upstanders/global/theme/colors.dart';



class Helper3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.white,
      body: Stack(
        children: [
          _Foreground(),
          
        ],
      ),
      bottomNavigationBar:_BottomButton(
        onTap: (){
          // Navigator.of(context).pushAndRemoveUntil(
          // MaterialPageRoute(builder: (context)=>MapViewScreen2(), ),
          // (routes)=>false
       //  );

          }
      )
      
    );
    
  }
}


class _Foreground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png",height: 80, width: 80,),
          SizedBox(height: size.height * 0.03,),

          Text(
            "Thank you for responding,\nthe acronym for the alert is:",
             textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: MyTheme.black),
          ),
          //  SizedBox(height: size.height * 0.01,),

          Text(
            "DIXON",
             textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                height: 1.5,
                letterSpacing:8 ,
                fontWeight: FontWeight.bold,
                color: MyTheme.black),
          ),


        ],
      ),
      
    );
  }
}

class _BottomButton extends StatelessWidget {
  final void Function() onTap;

  const _BottomButton({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height:size.height * 0.08,
          color: MyTheme.primaryColor,
          child:  Text(
            "CONTINUE",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: MyTheme.black),
          ),

        ),
      ) ;
  }
}