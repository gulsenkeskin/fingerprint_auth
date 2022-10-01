import 'package:fingerprint_auth/main.dart';
import 'package:flutter/material.dart';

class FingerprintPage extends StatelessWidget {
  const FingerprintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Padding(
          padding:const EdgeInsets.all(30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildAvailability(context),
                const SizedBox(height: 24),
                buildAuthenticate(context),
              ],
            ),
          ),
        ),
      );

  Widget buildAvailability(BuildContext context) => buildButton(
      text: 'Kullanılabilirliği kontrol et',
      icon: Icons.event_available,
      onClicked: () {});

  Widget buildButton(
          {required String text,
          required IconData icon,
          required VoidCallback onClicked}) =>
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        icon: Icon(icon, size: 26),
        label: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );

  Widget buildAuthenticate(BuildContext context) => buildButton(
      text: 'Kimlik Doğrulama', icon: Icons.lock_open, onClicked: () {});
}
