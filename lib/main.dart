import 'package:flutter/material.dart';
import 'package:flutter_web/screens/about_screen.dart';
import 'package:flutter_web/screens/contact_screen.dart';
import 'package:flutter_web/screens/home_screen.dart';
import 'package:flutter_web/screens/my_services_screen.dart';
import 'package:flutter_web/screens/my_work_screen.dart';
import 'package:flutter_web/widgets/nav_bar_item_widget.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage()));
}
final appTheme = ThemeData(
  primarySwatch: Colors.red,
);

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

List<bool> selected = [true, false, false, false, false];

class _MainPageState extends State<MainPage> {
  List<IconData> icon = const[
    Icons.home_filled,
    Icons.person,
    Icons.design_services,
    Icons.work_history,
    Icons.contact_mail,

  ];

  List<Widget> screens=[
    const HomePage(),
    Container(
      height:double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,

      ),
      child: const AboutScreen(),
    ),
    Container(
      height:double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,

      ),
      child: const MyServicesScreen(),
    ),
    Container(
      height:double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,

      ),
      child: CarouselWithIndicatorDemo(),
    ),
    Container(
      height:double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,

      ),
      child: const ContactScreen(),
    ),
  ];



  int selectedIndex=0;

  void select(int n) {
    for (int i = 0; i < icon.length; i++) {
      if (i == n) {
        selected[i] = true;
      } else {
        selected[i] = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.grey.shade200,
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                height: MediaQuery.of(context).size.height,
                width: 101.0,
                decoration: BoxDecoration(
                  color: const Color(0xff332A7C),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 110,
                      child: Column(children:  icon
                          .map(
                            (e) => NavBarItem(
                          icon: e,
                          selected: selected[icon.indexOf(e)],
                          onTap: () {
                            setState(() {
                              select(icon.indexOf(e));
                              selectedIndex=icon.indexOf(e);
                            });
                          },
                        ),
                      )
                          .toList(),),
                    ),
                  ],
                ),
              ),
              Expanded(child: screens[selectedIndex])
            ],
          ),
        ],
      ),
    );
  }
}






