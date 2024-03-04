import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Color bigbuttoncolor = const Color(0xFF312C27);
    Color midbuttoncolor = const Color(0xFF484242);
    Color smallestbuttoncolor = const Color(0xFF504847);
    bool isOn = false;

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
                (isOn)? Icons.wb_sunny : Icons.wb_sunny_outlined,
                size: 100,
                color: (isOn)?const Color(0xFFFF8E01): const Color(0xFF504847),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'FlashLight:${(isOn)?"ON":"OFF"}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Circlecontain(color: bigbuttoncolor, h: 300, w: 300),
                  Circlecontain(color: midbuttoncolor, h: 260, w: 260),
                  Container(
                    width: 190,
                    height: 190,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.power_settings_new,
                        size: 170,
                      ),style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                      ),
                      backgroundColor: smallestbuttoncolor!,
                      foregroundColor: const Color(0xFFFF8E01),
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
  Circlecontain({required this.color, required this.h, required this.w});

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
