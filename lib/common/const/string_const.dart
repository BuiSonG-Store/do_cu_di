import 'package:flutter/material.dart';

class StringConst {
  static const String _path = 'StringConst.';
  static const String someThingWentWrong = 'Lỗi không xác định';
  static const String copiedToClipboard = 'Đã copy vào bộ nhớ tạm';
  static const String connectError = 'Vui lòng kiểm tra internet của bạn';

  static List<BoxShadow> defaultShadow = [
    BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 3,
        blurRadius: 5,
        offset: const Offset(0, 4))
  ];

  static const String contentCamera =
      'Cho phép chúng tôi truy cập quyền này sẽ giúp cho bạn chọn được ảnh';
  static const String titlePhoto =
      'Bạn có cho phép GStore truy cập vào bộ sưu tập ảnh của bạn không?';
  static const String allow = 'Cho phép';
  static const String notAllow = 'Không cho phép';
  static const String appName = 'Đồ cũ đi';
  static const String login = 'Đăng nhập';
  static const String register = 'Đăng ký';
  static const String fillUserName = 'Nhập điện thoại hoặc tên đăng nhập...';
  static const String password = 'Mật khẩu';
  static const String rePassword = 'Nhập lại mật khẩu';
  static const String or = 'Hoặc';
  static const String youHaveAcc = 'Bạn đã có tài khoản';
  static const String nameUser = 'Tên của bạn';
}
