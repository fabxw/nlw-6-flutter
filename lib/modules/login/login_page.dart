import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              decoration: BoxDecoration(
                color: AppColors.background,
                gradient: RadialGradient(
                  center: Alignment.bottomCenter,
                  colors: [AppColors.backgroundGradient, AppColors.primary],
                  radius: 0.8,
                  stops: [0.2, 1],
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                width: size.width * 0.35,
                height: size.height * 0.35,
              ),
            ),
            Positioned(
              bottom: size.height * 0.13,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, top: 30),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      textAlign: TextAlign.center,
                      style: TextStyles.titleHome,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 50, right: 50, top: 50),
                    child: SocialLoginButton(
                      onTap: () {
                        controller.googleSingIn(context);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: size.height * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white,
                  ],
                  stops: [0.7, 0.92],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
