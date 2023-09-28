import 'package:encrypt/encrypt.dart';

class Encryption {
  static late Key _key; //32 chars
  static late IV _iv ; //16 chars
  Encryption({required String key,required String iv}){
    _key = Key.fromUtf8(key);
    _iv = IV.fromUtf8(iv);
  }


 String encryptMyData(String text) {
    final e = Encrypter(AES(_key, mode: AESMode.cbc));
    final encrypted_data = e.encrypt(text, iv: _iv);
    return encrypted_data.base64;
  }

//dycrypt
  String decryptMyData(String text) {
    final e = Encrypter(AES(_key, mode: AESMode.cbc));
    final decrypted_data = e.decrypt(Encrypted.fromBase64(text), iv: _iv);
    return decrypted_data;
  }


}
