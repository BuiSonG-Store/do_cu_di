import 'dart:convert';

import 'package:do_cu_di/common/const/image_const.dart';
import 'package:flutter/material.dart';

import '../../../../common/const/key_save_data_local.dart';
import '../../../../common/local/app_cache.dart';
import '../../../../common/local/local_app.dart';
import '../../../../common/model/profile_model.dart';
import '../../../../common/navigation/route_names.dart';
import '../../../../common/utils/log_util.dart';
import '../../../injector_container.dart';
import '../../../routes.dart';
import '../../../themes/theme_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _initData();
    super.initState();
  }

  void _initData() async {
    String? dataProfile = injector<LocalApp>()
        .getStringSharePreference(KeySaveDataLocal.keySaveDataProfile);
    LOG.d('_initData: $dataProfile');
    await Future.delayed(const Duration(seconds: 2));
    if (dataProfile?.isNotEmpty ?? false) {
      injector<AppCache>().profileModel =
          ProfileModel.fromJson(json.decode(dataProfile!));
      Routes.instance.navigateAndRemove(RouteName.containerScreen);
    } else {
      Routes.instance.navigateAndRemove(RouteName.containerScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(500),
          child: Image.asset(
            ImageConst.logo,
            height: 250,
            width: 250,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
