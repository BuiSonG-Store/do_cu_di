import 'package:do_cu_di/presentation/routes.dart';
import 'package:do_cu_di/presentation/themes/theme_color.dart';
import 'package:do_cu_di/presentation/widgets/loading_container.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/bloc/snackbar_bloc/snackbar_bloc.dart';
import '../common/bloc/snackbar_bloc/snackbar_state.dart';
import '../common/const/app_const.dart';
import '../common/navigation/route_names.dart';
import 'injector_container.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<BlocListener> _getBlocListener(context) => [
        BlocListener<SnackBarBloc, SnackBarState>(
            listener: _mapListenerSnackBarState),
      ];

  List<BlocProvider> _getProviders() => [
        BlocProvider<SnackBarBloc>(
          create: (_) => injector<SnackBarBloc>(),
        ),
      ];

  void _mapListenerSnackBarState(BuildContext context, SnackBarState state) {
    if (state is ShowSnackBarState) {
      Icon icon;
      Color color;
      String title;
      switch (state.type) {
        case SnackBarType.success:
          icon = const Icon(
            Icons.check_circle_outline,
            color: Colors.white,
          );
          color = const Color(0xff33B44A);
          title = "Success";
          break;
        case SnackBarType.warning:
          icon = const Icon(
            Icons.error_outline,
            color: Colors.white,
          );
          color = Colors.orange;
          title = "Warning";
          break;
        default:
          icon = const Icon(
            Icons.error_outline,
            color: Colors.white,
          );
          color = const Color(0xffF63E43);
          title = "Failed";
          break;
      }

      showFlash(
        context: Routes.instance.navigatorKey.currentContext!,
        duration: state.duration ?? const Duration(milliseconds: 3000),
        builder: (context, controller) {
          return Flash.bar(
            controller: controller,
            backgroundColor: color,
            position: FlashPosition.top,
            horizontalDismissDirection: HorizontalDismissDirection.startToEnd,
            margin: const EdgeInsets.all(8),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            forwardAnimationCurve: Curves.easeOutBack,
            reverseAnimationCurve: Curves.easeInCubic,
            child: FlashBar(
              title: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
              ),
              content: Text(
                state.mess!,
                style: const TextStyle(color: Colors.white),
              ),
              icon: icon,
              shouldIconPulse: true,
              showProgressIndicator: false,
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _getProviders(),
      child: ScreenUtilInit(
        designSize: Size(CommonConst.widthDesign, CommonConst.heightDesign),
        builder: (BuildContext context, child) => MaterialApp(
          navigatorKey: Routes.instance.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: '????? c?? ??i',
          onGenerateRoute: Routes.generateRoute,
          initialRoute: RouteName.splashScreen,
          theme: ThemeData(
              primaryColor: AppColors.primaryColor,
              fontFamily: 'Nunito',
              canvasColor: Colors.transparent,
              bottomAppBarColor: const Color(0xff989898),
              platform: TargetPlatform.iOS,
              pageTransitionsTheme: const PageTransitionsTheme(builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              })),
          builder: (context, widget) {
            ScreenUtil.init(context);
            return LoadingContainer(
              child: MultiBlocListener(
                listeners: _getBlocListener(context),
                child: GestureDetector(
                  child: widget ?? const SizedBox(),
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
