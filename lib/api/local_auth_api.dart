import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async{
    try{
      return await _auth.canCheckBiometrics;
    }on PlatformException catch(e){
      return false;
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable=await hasBiometrics();
    if(!isAvailable) return false;

    try {
      return await _auth.authenticate(
        localizedReason: 'Kimlik doğrulaması için parmak izini tara',
        options: const AuthenticationOptions(
          //uygulamayı arka plana alıp yeniden açınca parmak izini yeniden doğrulamasını ister
          stickyAuth: true,
          //parmak izi doğrulanmamışsa dialog çıkartır
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      return false;
    }
  }
}
