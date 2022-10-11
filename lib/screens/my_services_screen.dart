import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_web/models/service_obj.dart';
import 'package:flutter_web/widgets/service_container_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({Key? key}) : super(key: key);

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  @override
  Widget build(BuildContext context) {
    ServiceObj androidservice=ServiceObj(iconPath: 'assets/icons/android.png',
        title: 'Android Apps',
        description: 'I have been developing android apps for around four years now early two years with native java and android studio and flutter'
    );

    ServiceObj iosService=ServiceObj(iconPath: 'assets/icons/apple.png',
        title: 'IOS Apps',
        description: 'I have been developing Ios apps for two years now using Flutter for Android studio and Xcode.'
    );

    ServiceObj uiUxService=ServiceObj(iconPath: 'assets/icons/ux.png',
        title: 'UI/UX Design',
        description: 'I am not a professional UI UX Designer but As a freelance developer I design most of my project on my own.'
    );

    ServiceObj webService=ServiceObj(iconPath: 'assets/icons/web.png',
        title: 'Web Apps',
        description: 'I have created some static websites using Html Css and Have some web Experience With flutter as well'
    );

    return SafeArea(child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('My Awesome',style: GoogleFonts.akayaTelivigala(
                  textStyle: const TextStyle(color: Colors.black,fontSize: 21,fontWeight: FontWeight.bold),
                )),
                Text('Services',style: GoogleFonts.akayaTelivigala(
                  textStyle: const TextStyle(color: Colors.orange,fontSize: 32,fontWeight: FontWeight.bold),
                )),
                Text('I am Professional Mobile App Developer I Will Transform \nYour Thoughts To Beautiful Mobile Apps I Design \n'
                    'and Develop Mobile Apps for Ios and Android',
                  style: GoogleFonts.akayaTelivigala(
                    textStyle: const TextStyle(fontSize: 12,color: Colors.grey),
                  )),

                GestureDetector(
                  onTap: ()=>downloadFile('assets/homebg.jpg'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.orange
                    ),
                    child: Text("Download Cv",style: GoogleFonts.akayaTelivigala(
                      textStyle: const TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],),

              ServiceContainer(service: androidservice),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
          ServiceContainer(service: iosService),
          ServiceContainer(service: uiUxService),
          ServiceContainer(service: webService),
        ],)
      ],
    ));
  }

  void downloadFile(url){
    AnchorElement anchorElement=AnchorElement(href: url);
    anchorElement.download="JawaidCv";
    anchorElement.click();
  }
}
