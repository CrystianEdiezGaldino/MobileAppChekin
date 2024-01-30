// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appregfrequency/app/pages/invitation/invitation_page.dart';
import 'package:flutter/material.dart';

import 'package:appregfrequency/app/controllers/controller.dart';

class ConvitesFeature extends StatelessWidget {
  final RegfController regfController;
  const ConvitesFeature({
    Key? key,
    required this.regfController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedBuilder(
            animation: regfController,
            builder: (context, child) => ConvitePage(
                  regfController: regfController,
                )),
      ),
    );
  }
}
