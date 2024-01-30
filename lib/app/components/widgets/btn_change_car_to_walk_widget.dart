import 'package:appregfrequency/app/controllers/controller.dart';
import 'package:flutter/material.dart';

class BtnChangeCarToWalkWidget extends StatelessWidget {
  final RegfController regfController;

  const BtnChangeCarToWalkWidget({
    super.key,
    required this.regfController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Icon(
                regfController.iswalkToCar ? Icons.directions_car_outlined : Icons.directions_walk_outlined,
                size: 40,
                color: const Color.fromARGB(255, 78, 78, 78),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
