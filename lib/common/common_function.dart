import 'dart:math';

String generateUpiTransactionID(int length) {
  var number = "";
  var randomnumber = Random();
  //change i < 12 on your digits need
  for (var i = 0; i < length; i++) {
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


String getInitials(String customString) => customString.isNotEmpty
    ? customString.trim().split(' ').map((l) => l[0]).take(2).join()
    : '';