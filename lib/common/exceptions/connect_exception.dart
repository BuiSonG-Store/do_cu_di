import '../const/string_const.dart';
import 'app_exception.dart';

class ConnectException extends AppException {
  ConnectException({String? message})
      : super(
          message: message ?? StringConst.connectError,
        );
}
