import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../presentation/injector_container.dart';
import '../../presentation/routes.dart';
import '../bloc/snackbar_bloc/snackbar_bloc.dart';
import '../bloc/snackbar_bloc/snackbar_event.dart';
import '../bloc/snackbar_bloc/snackbar_state.dart';
import '../const/string_const.dart';
import '../exceptions/app_exception.dart';
import '../exceptions/connect_exception.dart';
import '../exceptions/timeout_exception.dart';
import '../exceptions/token_expired_exception.dart';
import '../navigation/route_names.dart';
import '../network/configs.dart';
import 'log_util.dart';

class CommonUtil {
  static void dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static bool isNull(dynamic input) {
    return ["", null, false, 0].contains(input);
  }

  static String textHelloInHome() {
    int hour = DateTime.now().hour;
    if (hour >= 4 && hour < 12) {
      return StringConst.goodMorning;
    }
    if (hour == 12) {
      return StringConst.goodLunch;
    }
    if (hour >= 13 && hour <= 18) {
      return StringConst.goodAfterNoon;
    }
    return StringConst.goodEvening;
  }

  static bool validateAndSave(GlobalKey<FormState> key) {
    FormState? form = key.currentState;
    if (form?.validate() ?? false) {
      form?.save();
      return true;
    }
    return false;
  }

  static void handleException(SnackBarBloc? snackBarBloc, e,
      {required String methodName,
      String? exceptionName,
      bool showSnackbar = true,
      bool logBug = true,
      String? text}) async {
    LOG.e('Exception: ${e.toString()} | $methodName | $exceptionName');
    if (e is TokenExpiredException) {
      injector<SnackBarBloc>().add(ShowSnackbarEvent(
        content: e.message,
        type: SnackBarType.warning,
      ));
      Routes.instance.navigateAndRemove(RouteName.loginScreen);
      return;
    }
    if ((e is TimeOutException || e is ConnectException) &&
        snackBarBloc != null) {
      snackBarBloc.add(ShowSnackbarEvent(
        content: '???????ng truy???n c???a b???n kh??ng ???n ?????nh, vui l??ng th??? l???i',
        type: SnackBarType.warning,
      ));
      return;
    }

    final message = (e is AppException) ? e.message : 'L???i kh??ng x??c ?????nh';

    if (showSnackbar && snackBarBloc != null) {
      snackBarBloc.add(ShowSnackbarEvent(content: exceptionName ?? message));
    }
  }

  /// yyyy-MM-ddTHH:mm:ss => HH:mm - dd/MM/yyyy
  static dynamic convertDateTime(String? input,
      {bool outputDateTime = false, String? format}) {
    if (input?.isEmpty ?? true) {
      return null;
    }
    DateFormat dateFormat = DateFormat(format ?? "yyyy-MM-ddTHH:mm:ss");
    DateFormat dateFormatText = DateFormat("HH:mm - dd/MM/yyyy");
    DateTime dateTime = dateFormat.parse(input!);
    if (outputDateTime == true) {
      return dateTime;
    }
    return dateFormatText.format(dateTime);
  }
}
