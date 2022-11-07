import 'dart:convert';

import 'package:cryptography/cryptography.dart';

Future<void> doAES(List<int> plainText) async {
  var cipherAlgorithm = AesCtr.with256bits(macAlgorithm: Hmac.sha512());
  var cipherSecretKey = await cipherAlgorithm.newSecretKey();
  var cipherNonce = cipherAlgorithm.newNonce();

  var secretBox =
      await cipherAlgorithm.encrypt(plainText, secretKey: cipherSecretKey);

  print('PlainText  : ${Utf8Decoder().convert(plainText)}');
  print('Nonce      : ${secretBox.nonce}');
  print('Ciphertext : ${secretBox.cipherText}');
  print('MAC        : ${secretBox.mac.bytes}');

  var clearText =
      await cipherAlgorithm.decrypt(secretBox, secretKey: cipherSecretKey);

  print('Decrypted  : ${Utf8Decoder().convert(clearText)}');
}
