import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web/widgets/header_left.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                child: Container(
                    width: 300,
                    height: 270,
                    child: SvgPicture.asset('assets/svg/programming.svg',))
              ),
          ],),
        )
        
      ],
    );
  }
}
