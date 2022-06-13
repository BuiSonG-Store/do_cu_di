import 'package:do_cu_di/presentation/journey/authentication/register/register_screen.dart';
import 'package:do_cu_di/presentation/journey/feature/container/container_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/bloc/loading_bloc/loading_bloc.dart';
import '../common/bloc/loading_bloc/loading_event.dart';
import '../common/navigation/route_names.dart';
import '../common/utils/log_util.dart';
import 'injector_container.dart';
import 'journey/authentication/login/login_screen.dart';
import 'journey/feature/screens/splash_screen.dart';
import 'journey/feature/setting/setting_screen.dart';
import 'journey/feature/setting/update_information/update_ersonal_information_screen.dart';
import 'journey/feature/webview/webview_screen.dart';

class Routes {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory Routes() => _instance;

  Routes._internal();

  static final Routes _instance = Routes._internal();

  static Routes get instance => _instance;

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAndNavigateTo(
      {dynamic result, String? routeName, dynamic arguments}) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName ?? '', arguments: arguments);
  }

  Future<dynamic> navigateAndRemove(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  dynamic popUntil() {
    return navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  Future<dynamic> navigateAndReplace(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  dynamic pop({dynamic result}) {
    injector<LoadingBloc>().add(FinishLoading());
    return navigatorKey.currentState!.pop(result);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    LOG.d('LOG ROUTE_NAVIGATOR: ${settings.name}');
    switch (settings.name) {
      case RouteName.webViewScreen:
        return CupertinoPageRoute(
          builder: (context) =>
              WebViewScreen(url: settings.arguments as String),
        );
      case RouteName.splashScreen:
        return CupertinoPageRoute(
          builder: (context) => SplashScreen(),
        );
      case RouteName.containerScreen:
        return CupertinoPageRoute(
          builder: (context) => ContainerScreen(),
        );
      case RouteName.loginScreen:
        return CupertinoPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RouteName.registerScreen:
        return CupertinoPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case RouteName.settingScreen:
        return CupertinoPageRoute(
          builder: (context) => SettingScreen(),
        );

      case RouteName.updateInformationScreen:
        return CupertinoPageRoute(
          builder: (context) => UpdateInformationScreen(),
        );

      default:
        return _emptyRoute(settings);
    }
  }

  static MaterialPageRoute _emptyRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }
}
