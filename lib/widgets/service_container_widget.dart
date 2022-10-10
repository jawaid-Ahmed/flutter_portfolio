import 'package:flutter/material.dart';
import 'package:flutter_web/models/service_obj.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceContainer extends StatelessWidget {
  final ServiceObj service;

  const ServiceContainer({Key? key,required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade50,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(3,-4),
              spreadRadius: 3,
              blurRadius: 4
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image(image: AssetImage(service.iconPath),height: 50,width: 50,fit: BoxFit.cover,),
          Text(service.title,style: GoogleFonts.akayaTelivigala(
            textStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),
          )),
          Wrap(
            children: [
              Text(service.description,style: GoogleFonts.akayaTelivigala(
                textStyle: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w200,fontSize: 12),
              ),
              textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 3,),
            ],
          )
        ],),
      ),
    );
  }
}
