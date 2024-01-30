import 'package:flutter/material.dart';

class SucesseImgAnimation extends StatefulWidget {
  const SucesseImgAnimation({super.key});
  @override
  State<SucesseImgAnimation> createState() => _SucesseImgAnimationState();
}

class _SucesseImgAnimationState extends State<SucesseImgAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Card(
          color: const Color.fromARGB(255, 18, 182, 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90),
          ),
          elevation: 8,
          shadowColor: const Color.fromARGB(187, 8, 229, 74).withOpacity(0.9),
          child: SizedBox(
            width: 120.0,
            height: 120.0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Image.asset(
                'assets/imagens/hand_up.png',
                scale: 0.7,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
