
import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool inOn = false;
  bool _isColorChanged = false;
  AnimationController? controller;
  Animation<Color?>? coloranimationbigbutton;
  Animation<Color?>? coloranimationmidbutton;
  Animation<Color?>? coloranimationsmallbutton;
  Color? bigbuttoncolor = const Color(0xFF312C27);
  Color? midbuttoncolor = const Color(0xFF484242);
  Color? smallestbuttoncolor = const Color(0xFF504847);

  void _changedcolor() {
    if (_isColorChanged) {
      controller!.reverse();
    } else {
      controller!.forward();
    }
    _isColorChanged = !_isColorChanged;
  }

  @override
  void initState() {
    _isTorchAvailable;
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    coloranimationbigbutton = ColorTween(
        begin: bigbuttoncolor, end: Color(0xFF312C27).withOpacity(0.3))
        .animate(controller!);

    coloranimationbigbutton = ColorTween(
        begin: Color(0xFF484242), end: Color(0xFFFF8E01).withOpacity(0.3))
        .animate(controller!);

    coloranimationbigbutton = ColorTween(
        begin: Color(0xFF504847), end: Color(0xFFFF8E01).withOpacity(0.3))
        .animate(controller!);
    controller?.addListener(() {
      setState(() {
        bigbuttoncolor = coloranimationbigbutton?.value;
        midbuttoncolor = coloranimationmidbutton?.value;
        smallestbuttoncolor = coloranimationsmallbutton?.value;
      });
    });

  }

  Future<bool> _isTorchAvailable(BuildContext context) async {
    try {
      return await TorchLight.isTorchAvailable();
    } on Exception catch (e) {
      print('error');
      showmessage (
        'Could not check if the device has an available torch',
      );
      rethrow;
    }
  }

  Future<void> torchlight() async {
    if (inOn) {
      try {
        return await TorchLight.enableTorch();
      }
      on Exception catch (_) {
        showmessage('Could not enable torch');
        rethrow;
      }
    }
    else {
      try {
        return await TorchLight.disableTorch();
      }on Exception catch(_){
        showmessage('could not disable tourch');
        rethrow;
      }
    }
  }



    void showmessage(String message){
      showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              actions: [
                Center(
                  child: Text(
                    'AlERT',style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                Center(
                  child: Text(
                    message,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            );
          }
      );
    }


  @override
  Widget build(BuildContext context) {
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
              Text(
                'FlashLight:${(inOn) ? "ON" : "OFF"}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Circlecontain(
                      color: (inOn) ? Color(0xFF312C27).withOpacity(0.3) : bigbuttoncolor!,
                      h: 300,
                      w: 300),
                  Circlecontain(
                      color: (inOn) ? Color(0XFFFF8E01).withOpacity(0.4) : midbuttoncolor!,
                      h: 260,
                      w: 260),
                  SizedBox(
                    width: 190,
                    height: 190,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (inOn)
                            inOn = false;
                          else
                            inOn = true;
                        });
                        torchlight();
                        _isColorChanged;
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        backgroundColor:
                            (inOn) ? Color(0xFFFF8E01) : smallestbuttoncolor,
                        foregroundColor:
                            (inOn) ? Color(0xFF504847) : Color(0xFFFF8E01),
                      ),
                      child: const Icon(
                        Icons.power_settings_new,
                        size: 120,
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
