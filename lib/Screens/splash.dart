import 'package:flutter/material.dart';
import 'package:quran_app/Screens/home.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  double opacity = 0;
  startAnimation() {
    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        opacity = 1;
      });
    });
    Future.delayed(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => SourasView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: opacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                // Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(125),
                //   ),
                Expanded(
                  child: Image.asset(
                    'assets/images/quran.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
