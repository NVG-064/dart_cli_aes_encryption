import 'package:dart_cli_aes_encryption/dart_cli_aes_encryption.dart'
    as dart_cli_aes_encryption;

void main(List<String> arguments) {
  String myChar = "ZZZZZZZZZZZZZZ ZZZZZZZZ";
  dart_cli_aes_encryption.doAES(myChar.codeUnits);
}
