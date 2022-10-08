import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter/material.dart';
class GlassMorphic extends StatelessWidget {
  const GlassMorphic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      borderRadius: 15,
      blur: 7,
      alignment: Alignment.bottomCenter,
      border: 0,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFF75035).withAlpha(55),
            const Color(0xFFffffff).withAlpha(45),
          ],
          stops: const[
            0.3,
            1,
          ]),
      borderGradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            const Color(0xFF4579C5).withAlpha(100),
            const Color(0xFFFFFFF).withAlpha(55),
            const Color(0xFFF75035).withAlpha(10),
          ],
          stops:const [
            0.06,
            0.95,
            1
          ]),

    );
  }
}
