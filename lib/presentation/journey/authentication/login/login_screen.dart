import 'package:do_cu_di/common/const/image_const.dart';
import 'package:do_cu_di/common/const/logo_const.dart';
import 'package:do_cu_di/common/const/string_const.dart';
import 'package:do_cu_di/presentation/themes/theme_color.dart';
import 'package:do_cu_di/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../../common/navigation/route_names.dart';
import '../../../../common/utils/validate_ultils.dart';
import '../../../routes.dart';
import '../../../themes/theme_text.dart';
import '../../../widgets/button_bottom.dart';
import '../../../widgets/text_field/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  bool _obscureText = true;

  void _onRegister() {
    Routes.instance.navigateTo(RouteName.registerScreen);
  }

  void _onForgotPass() {}

  void _onLogin() async {}

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.white,
      customAppBar: const CustomAppBar(
        title: StringConst.login,
        showIconLeft: false,
      ),
      body: Container(
        color: AppColors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageConst.banner,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    CustomTextField(
                      hintText: StringConst.fillUserName,
                      controller: userNameController,
                      onValidate: ValidateUtils.validEmail,
                      textInputType: TextInputType.emailAddress,
                      maxLine: 1,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      maxLine: 1,
                      hintText: '${StringConst.password}...',
                      controller: passWordController,
                      onValidate: ValidateUtils.validatePassword,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: _obscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(
                            _obscureText ? IconConst.hide : IconConst.show,
                            width: 16,
                            height: 16,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            'Quên mật khẩu!',
                            style: AppTextTheme.normalLink,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ButtonBottom(
                      color: AppColors.logoSkyBlue,
                      paddingHorizontal: 0,
                      text: StringConst.login,
                      haveIcon: false,
                      onTap: _onLogin,
                    ),
                    Row(children: [
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 15.0),
                            child: const Divider(
                              color: Colors.black,
                              height: 50,
                            )),
                      ),
                      const Text(
                        StringConst.or,
                        style: AppTextTheme.mediumBlack,
                      ),
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: const Divider(
                            color: Colors.black,
                            height: 50,
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: ButtonBottom(
                        color: AppColors.logoGreen,
                        paddingHorizontal: 0,
                        text: StringConst.register,
                        haveIcon: false,
                        onTap: _onRegister,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
