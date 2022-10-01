import 'package:fingerprint_auth/main.dart';
import 'package:flutter/material.dart';

class FingerprintPage extends StatelessWidget {
  const FingerprintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title:const Text(MyApp.title),
      centerTitle: true,
    ),
  );
}
