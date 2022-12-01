import 'dart:convert';
import 'package:cryptography/cryptography.dart';

Future<void> doAES(List<int> plainText) async {
  var cipherAlgorithm = AesCtr.with256bits(macAlgorithm: Hmac.sha512());
  var cipherSecretKey = await cipherAlgorithm.newSecretKey();
  var cipherNonce = cipherAlgorithm.newNonce();

// SecretBox mirip seperti kotak yang terisolasi
  var secretBox = await cipherAlgorithm.encrypt(plainText,
      secretKey: cipherSecretKey, nonce: cipherNonce);

  print(
      'PlainText  : ${Utf8Decoder().convert(plainText)} as integer: $plainText');
  print('=======================================');
  print('MAC        : ${secretBox.mac.bytes}');
  print('Nonce      : ${secretBox.nonce}');
  // print('Secret Key : ${secretBox}');
  print('=======================================');
  print('Ciphertext : ${Utf8Decoder().convert(secretBox.cipherText)}');

  var clearText =
      await cipherAlgorithm.decrypt(secretBox, secretKey: cipherSecretKey);

  print('Decrypted  : ${Utf8Decoder().convert(clearText)}');
}
