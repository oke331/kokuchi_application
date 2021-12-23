import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> commonToast({String msg}) async {
  await Fluttertoast.showToast(
    msg: msg,
    textColor: Colors.white,
    backgroundColor: Colors.green,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
  );
}
