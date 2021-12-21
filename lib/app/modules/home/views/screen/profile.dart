import 'package:auth_firebaseuas/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // ignore: deprecated_member_use
        width: 200,
        height: 45,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () => authC.logout(),
          child: Text(
            "Logout",
            style: TextStyle(
              color: Color(0xff000000),
            ),
          ),
        ),
      ),
    );
  }
}
//  onPressed: () => authC.logout(),
