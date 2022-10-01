import 'package:fingerprint_auth/api/local_auth_api.dart';
import 'package:fingerprint_auth/main.dart';
import 'package:fingerprint_auth/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class FingerprintPage extends StatelessWidget {
  const FingerprintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
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
      onClicked: () async {
        final isAvailable = await LocalAuthApi.hasBiometrics();
        final biometrics = await LocalAuthApi.getBiometrics();

        final hasFingerprint = biometrics.contains(BiometricType.fingerprint);

        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Availability'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildText('Biometrics', isAvailable),
                      buildText('Fingerprint', hasFingerprint),
                    ],
                  ),
                ));
      });

  Widget buildText(String text, bool checked) => Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            checked
                ? const Icon(Icons.check, color: Colors.green, size: 24)
                : const Icon(Icons.close, color: Colors.red, size: 24),
            const SizedBox(width: 12),
            Text(text, style: const TextStyle(fontSize: 24)),
          ],
        ),
      );

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
      text: 'Kimlik Doğrulama',
      icon: Icons.lock_open,
      onClicked: () async {
          final isAuthenticated = await LocalAuthApi.authenticate();

        if (isAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      });
}
