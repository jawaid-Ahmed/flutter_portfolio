import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {

  final double width;
  final double height;
  final Color color;
  final String icon;
  final Function onClick;

  SocialButton({
    required this.color,
    required this.width,
    required this.height,
    required this.icon,
    required this.onClick
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color,shape: BoxShape.circle),
      width: width,
      height: height,
      child: FloatingActionButton(backgroundColor:Colors.transparent ,enableFeedback: true, onPressed: () {
        onClick.call();

      }, child: Image.asset(icon,height: 50,width: 50,)),
    );
  }
}