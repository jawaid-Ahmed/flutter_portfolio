import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("About Me",style: GoogleFonts.akayaTelivigala(
            textStyle: TextStyle(fontSize: 42,color: Colors.black,fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                padding: EdgeInsets.only(top: 20,right: 8.0,bottom: 20),
                child: Text("Jawaid Ali",style: GoogleFonts.akayaTelivigala(
                  textStyle: TextStyle(fontSize: 42,color: Colors.orange,fontWeight: FontWeight.bold)
                ),textAlign: TextAlign.start,),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Text(
                  'I am a Software Engineer I have worked on web and mobile app development and I am familiar with linux Operating Systems and Currently I am design and develop mobile applications and publish them for android smart phones. I am highly skilled as a mobile developer routinely creating innovative and useful apps that are popular and that work well. I keep myself Updated with all letest technologies and published apps to properly improving mobile phone offerings. With today’s smartphone technology I understand that Apple’s Iphone products are at the top of the industry and I would love the opportunity to be a part of the mobile app development team. I have terrific attention to detail am organized efficient and possess superior applications development skills.'
                  ,style: GoogleFonts.akayaTelivigala(
                  textStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey)
                )
                  ,textAlign: TextAlign.start,maxLines: 12,overflow: TextOverflow.ellipsis,),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: const Image(image: AssetImage('assets/icons/gmail.png'),)),
                      IconButton(onPressed: (){}, icon: const Image(image: AssetImage('assets/icons/github.png'),)),
                      IconButton(onPressed: (){}, icon: const Image(image: AssetImage('assets/icons/facebook.png'),)),
                      IconButton(onPressed: (){}, icon: const Image(image: AssetImage('assets/icons/instagram.png'),)),
                      IconButton(onPressed: (){}, icon: const Image(image: AssetImage('assets/icons/whatsapp.png'),)),
                    ],),
                )
            ],),
          const Image(image: AssetImage('assets/person.png'),height: 400,width: 300,fit: BoxFit.cover,),
        ],),
      ),

    ],);
  }
}
