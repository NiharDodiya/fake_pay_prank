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

String qRResult = "";

String result =
    "upi://pay?pa=8460484914@paytm&pn=NIHAR%20DODIYA&mc=0000&mode=02&purpose=00&orgid=159761";
String result2 =
    "upi://pay?pa=dodiyanihar8460-1@okicici&pn=Nihar%20Dodiya&aid=uGICAgICQhtTQdg";

getName(String result) {
  var upiId = result.split("pa=")[1].split("&")[0];
  // var id = sp[1].split("&");
  // var finalUpiId = id[0];
  var userName = result.split("pn=")[1].split("&")[0].replaceAll("%20", " ");
  // var nm2 = nm[1].split("&");
  // var name = nm2[0].replaceAll("%20", " ");
  print("RECEIVER UPI ID  :  $upiId ");
  print("RECEIVER NAME  :  $userName");
}
