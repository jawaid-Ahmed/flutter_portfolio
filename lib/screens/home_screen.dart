
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web/widgets/header_left.dart';
import 'package:flutter_web/widgets/social_btn_widget.dart';
import 'dart:js' as js;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{


  late AnimationController animationController;
  late Animation degOneTranslationAnimation,degTwoTranslationAnimation,degThreeTranslationAnimation,degFourTranslationAnimation;
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
    degFourTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double >(begin: 0.0,end: 1.94), weight: 35.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.94,end: 1.0), weight: 65.0),
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
    
    Size size=MediaQuery.of(context).size;
    
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),

          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(image: AssetImage('assets/homebg.jpg'),width: size.width,height: size.height,fit: BoxFit.cover,)),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 600,
                width: size.width * 0.4,
                child: const HeaderLeft(),
              ),
            ),

              SizedBox(
                width: size.width * 0.4,
                height: 600,
                child: Stack(
                  children: [
                    Positioned(
                      top:40,right: 20,
                      child: SizedBox(
                          width: 300,
                          height: 270,
                          child: SvgPicture.asset('assets/svg/programming.svg',)),
                    ),

                    Positioned(
                        right: 50,
                        bottom: 50,
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
                              offset: Offset.fromDirection(getRadiansFromDegree(280),degFourTranslationAnimation.value * 100),
                              child: Transform(
                                transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degFourTranslationAnimation.value),
                                alignment: Alignment.center,
                                child: SocialButton(
                                  color: Colors.transparent,
                                  width: 50,
                                  height: 50,
                                  icon: 'assets/icons/linkedin.png',
                                  onClick: (){
                                    js.context.callMethod('open', ['https://www.linkedin.com/in/jawaid-ali-mangi-6a241716a']);
                                  },
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset.fromDirection(getRadiansFromDegree(240),degOneTranslationAnimation.value * 100),
                              child: Transform(
                                transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degOneTranslationAnimation.value),
                                alignment: Alignment.center,
                                child: SocialButton(
                                  color: Colors.transparent,
                                  width: 50,
                                  height: 50,
                                  icon: 'assets/icons/github.png',
                                  onClick: (){
                                    js.context.callMethod('open', ['https://github.com/jawaid-Ahmed']);

                                  },
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset.fromDirection(getRadiansFromDegree(200),degTwoTranslationAnimation.value * 100),
                              child: Transform(
                                transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degTwoTranslationAnimation.value),
                                alignment: Alignment.center,
                                child: Tooltip(
                                  message: 'jkahmed78@gmail.com',
                                  triggerMode: TooltipTriggerMode.tap,
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
                            ),
                            Transform.translate(
                              offset: Offset.fromDirection(getRadiansFromDegree(160),degThreeTranslationAnimation.value * 100),
                              child: Transform(
                                transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degThreeTranslationAnimation.value),
                                alignment: Alignment.center,
                                child: Tooltip(
                                  message: '+923023330817',
                                  triggerMode: TooltipTriggerMode.tap,
                                  child: SocialButton(
                                    color: Colors.transparent,
                                    width: 50,
                                    height: 50,
                                    icon: 'assets/icons/whatsapp.png',
                                    onClick: (){
                                    },
                                  ),
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
                )
              ),
          ],),
        )
        
      ],
    );
  }


}
