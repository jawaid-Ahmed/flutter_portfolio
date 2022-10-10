import 'package:flutter/material.dart';
import 'package:flutter_web/screens/my_work_screen.dart';

class WorkGridScreen extends StatefulWidget {
  const WorkGridScreen({Key? key}) : super(key: key);

  @override
  State<WorkGridScreen> createState() => _WorkGridScreenState();
}

class _WorkGridScreenState extends State<WorkGridScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts = List.generate(
        100000, (index) => {"id": index, "name": "Product $index"}).toList();

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: myProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder)=> CarouselWithIndicatorDemo(items: myProducts,index: index)));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: index % 2==0 ? Colors.amber : Colors.orange,
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(myProducts[index]["name"]),
                  ),
                );
              }),
        ));
  }
}
