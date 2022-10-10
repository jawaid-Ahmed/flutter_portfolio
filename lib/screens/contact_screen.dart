import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {

  TextEditingController nameController=TextEditingController();
  TextEditingController subjectController=TextEditingController();
  TextEditingController messageController=TextEditingController();

  String responseText='';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text('Get In Touch',style: GoogleFonts.akayaTelivigala(
                textStyle: const TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),

              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Contact Me For Help, Or Join The Team',style: GoogleFonts.akayaTelivigala(
                textStyle: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),

              ),),
            ),


            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.3),
                  border: Border.all(width: 2,color: Colors.white30)
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey.shade200,
                  //       offset: const Offset(3,-4),
                  //       spreadRadius: 3,
                  //       blurRadius: 4
                  //   ),
                  // ]
              ),
              child:Column(children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 15),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0,vertical: 15),
                  child: TextField(
                    controller: subjectController,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Subject',

                    ),
                  ),
                ),



                Container(
                  height: 150,
                  margin: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 15),
                  child: TextField(
                    controller: messageController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Message',
                    ),
                  ),
                ),

                Center(
                  child: Text(
                      responseText,
                      style: responseText=='Email Send Successfully'
                          ? const TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold)
                          :const TextStyle(color: Colors.green,fontSize: 25,fontWeight: FontWeight.bold) ),),

                InkWell(
                  onTap: () async {
                    if(validate()){
                      await sendEmail(
                        name: nameController.text.toString(),
                        subject: subjectController.text.toString(),
                        message: messageController.text.toString(),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.orange
                    ),
                    child:  Text("Send Email",style: GoogleFonts.akayaTelivigala(
                      textStyle: const TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),
                    )),
                  ),
                ),

              ],),
            )

        ],)
    );
  }

  showToast(String text){
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(text)));
  }

  bool validate() {

    if(nameController.text.isNotEmpty){
      if(subjectController.text.isNotEmpty){
        if(messageController.text.isNotEmpty){
          return true;
        }else {
          showToast('Provide Message');
        }
      }else {
        showToast('Provide Subject');
      }
    }else {
      showToast('Provide Name');
    }

    return false;
  }

  final serviceId='service_nhx334g';
  final templateId='template_fw709kn';
  final userId='PfrMDN6qX7IIaa0ut';

  Future sendEmail({
    required String name,
    required String subject,
    required String message,
  })async {

    final url=Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final respons=await http.post(
      url,
      headers: {
        'Content-Type':'application/json'
      },
      body: json.encode({
          'service_id':serviceId,
          'template_id':templateId,
          'user_id':userId,
          'template_params':{
            'user_name':name,
            'user_subject':subject,
            'user_message':message,
          }
      })
    );

    if(respons.statusCode==200){
      setState(() {
        responseText='Email Send Successfully';
      });
    }else{
      setState(() {
        responseText='Email Send Failed';
      });
    }

    print(respons.toString());

  }
}
