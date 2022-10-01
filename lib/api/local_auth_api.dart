
import 'package:local_auth/local_auth.dart';

class LocalAuthApi{
  static final _auth=LocalAuthentication();


  static Future<bool> authenticate() async{
    return await _auth.authenticate(localizedReason: 'Kimlik doğrulaması için parmak izini tara');

  }

}