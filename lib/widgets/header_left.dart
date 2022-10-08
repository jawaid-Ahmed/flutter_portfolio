import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/widgets/social_btn_widget.dart';

class HeaderLeft extends StatefulWidget {
  const HeaderLeft({Key? key}) : super(key: key);

  @override
  State<HeaderLeft> createState() => _HeaderLeftState();
}

class _HeaderLeftState extends State<HeaderLeft> with TickerProviderStateMixin{
  late AnimationController animationController;
  late Animation degOneTranslationAnimation,degTwoTranslationAnimation,degThreeTranslationAnimation;
  late Animation rotationAnimation;


  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.2,end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.4,end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.75,end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0,end: 0.0).animate(CurvedAnimation(parent: animationController
        , curve: Curves.easeOut));
    super.initState();
    animationController.addListener((){
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: size.width * 0.4,
                    height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Hey There!',style: TextStyle(fontSize: 35,color: Colors.white),),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("I'm Jawaid Ali",style: TextStyle(fontSize: 42,color: Colors.orange,fontWeight: FontWeight.bold),),
                        ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Professional Mobile App Developer I Will Transform \nYour Thoughts To Beautiful Mobile Apps I Design \n'
                              'and Develope Mobile Apps for Ios and Android',
                            style: TextStyle(fontSize: 12,color: Colors.grey.shade200),),
                         ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.orange
                          ),
                          child: const Text("Download Cv",style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                        ),

                      ],),
                  )),
              Positioned(
                  left: 30,
                  bottom: 30,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      IgnorePointer(
                        child: Container(
                          color: Colors.transparent,
                          height: 150.0,
                          width: 150.0,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(270),degOneTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: SocialButton(
                            color: Colors.transparent,
                            width: 50,
                            height: 50,
                            icon: 'assets/icons/github.png',
                            onClick: (){
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(225),degTwoTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degTwoTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: SocialButton(
                            color: Colors.transparent,
                            width: 50,
                            height: 50,
                            icon: 'assets/icons/gmail.png',
                            onClick: (){
                              print('Second button');
                            },
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: Offset.fromDirection(getRadiansFromDegree(180),degThreeTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degThreeTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: SocialButton(
                            color: Colors.transparent,
                            width: 50,
                            height: 50,
                            icon: 'assets/icons/whatsapp.png',
                            onClick: (){
                              print('Third Button');
                            },
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
                        alignment: Alignment.center,
                        child: SocialButton(
                          color: Colors.transparent,
                          width: 60,
                          height: 60,
                          icon: 'assets/socials.png',
                          onClick: (){
                            if (animationController.isCompleted) {
                              animationController.reverse();
                            } else {
                              animationController.forward();
                            }
                          },
                        ),
                      )

                    ],
                  ))
            ],
          ),
        )
    );
  }
}



