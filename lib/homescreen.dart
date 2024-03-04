import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool inOn = false;

  @override
  Widget build(BuildContext context) {
    Color bigbuttoncolor = const Color(0xFF312C27);
    Color midbuttoncolor = const Color(0xFF484242);
    Color smallestbuttoncolor = const Color(0xFF504847);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash App'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                (inOn) ? Icons.wb_sunny : Icons.wb_sunny_outlined,
                size: 100,
                color:
                    (inOn) ? const Color(0xFFFF8E01) : const Color(0xFF504847),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'FlashLight:OFF',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Circlecontain(color: bigbuttoncolor, h: 300, w: 300),
                  Circlecontain(color: midbuttoncolor, h: 260, w: 260),
                  SizedBox(
                    width: 190,
                    height: 190,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor: smallestbuttoncolor,
                        foregroundColor: const Color(0xFFFF8E01),
                      ),
                      child: const Icon(
                        Icons.power_settings_new,
                        size: 170,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Circlecontain extends StatelessWidget {
  const Circlecontain(
      {super.key, required this.color, required this.h, required this.w});

  final double w;
  final double h;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
