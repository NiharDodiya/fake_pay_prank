import 'dart:math';

String generateUpiTransactionID() {
  var number = "";
  var randomnumber = Random();
  //change i < 12 on your digits need
  for (var i = 0; i < 12; i++) {
    number = number + randomnumber.nextInt(9).toString();
  }
  print("upiTransactionId : $number");
  return number;
}

String getRandom(int length) {
  const ch = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  Random r = Random();
  return String.fromCharCodes(
      Iterable.generate(length, (_) => ch.codeUnitAt(r.nextInt(ch.length))));
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);


