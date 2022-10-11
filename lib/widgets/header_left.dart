import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderLeft extends StatefulWidget {
  const HeaderLeft({Key? key}) : super(key: key);

  @override
  State<HeaderLeft> createState() => _HeaderLeftState();
}

class _HeaderLeftState extends State<HeaderLeft> {


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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Hey There!',style: GoogleFonts.akayaTelivigala(
                            textStyle: const TextStyle(fontSize: 35,color: Colors.white),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("I'm Jawaid Ali",style: GoogleFonts.akayaTelivigala(
                            textStyle: const TextStyle(fontSize: 42,color: Colors.orange,fontWeight: FontWeight.bold),
                          )),
                        ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text('Professional Mobile App Developer I Will Transform \nYour Thoughts To Beautiful Mobile Apps I Design \n'
                              'and Develope Mobile Apps for Ios and Android',
                            style: GoogleFonts.akayaTelivigala(
                              textStyle: TextStyle(fontSize: 12,color: Colors.grey.shade200),
                            )),
                         ),

                        InkWell(
                          onTap: ()=>downloadFile('assets/homebg.jpg'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                            margin: const EdgeInsets.symmetric(vertical: 30),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.orange
                            ),
                            child:  Text("Hire Me",style: GoogleFonts.akayaTelivigala(
                              textStyle: const TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),

                      ],),
                  )),

            ],
          ),
        )
    );
  }
  void downloadFile(url){
    AnchorElement anchorElement=AnchorElement(href: url);
    anchorElement.download="JawaidCv";
    anchorElement.click();
  }
}



