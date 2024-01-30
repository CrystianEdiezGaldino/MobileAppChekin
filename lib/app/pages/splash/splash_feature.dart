import 'package:appregfrequency/app/components/widgets/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashFeature extends StatefulWidget {
  const SplashFeature({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashFeatureState createState() => _SplashFeatureState();
}

class _SplashFeatureState extends State<SplashFeature> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1900), () {
      Modular.to.pushNamed('/config');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BaseScreen(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 180.0,
                child: Image.asset(
                  'assets/imagens/logostart.png',
                  height: 100.0,
                  fit: BoxFit.fill,
                ),
              ),
              const SpinKitWave(
                size: 80,
                color: Color.fromARGB(248, 56, 137, 242),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
