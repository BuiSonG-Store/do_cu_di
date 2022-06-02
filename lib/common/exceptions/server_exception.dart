import '../const/string_const.dart';
import 'app_exception.dart';

class ServerException extends AppException {
  ServerException({
    String? message,
  }) : super(
          message: message ?? StringConst.someThingWentWrong,
        );
}
