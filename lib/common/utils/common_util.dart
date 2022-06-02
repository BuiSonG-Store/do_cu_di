import 'package:flutter/cupertino.dart';

class CommonUtil {
  static void dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
