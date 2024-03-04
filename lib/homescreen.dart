import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Color bigbuttoncolor = Color(0xFF312C27);
    Color midbuttoncolor = Color(0xFF484242);
    Color smallestbuttoncolor = Color(0xFF504847);
    bool inOn = false;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flash App'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wb_sunny_outlined,
                size: 100,
                color: Color(0xFF504847),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'FlashLight:OFF',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
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
                      child: Icon(
                        Icons.power_settings_new,
                        size: 170,
                      ),style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                      ),
                      backgroundColor: smallestbuttoncolor!,
                      foregroundColor: Color(0xFFFF8E01),
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
  const Circlecontain({required this.color, required this.h, required this.w});

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
