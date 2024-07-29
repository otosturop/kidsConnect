import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../../core/constants/color_constant.dart';
import '../../../product/widgets/app_button.dart';
import '../viewModel/login_view_model.dart';
import '../../../product/widgets/app_textfields.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});
  static String routeName = 'LoginScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.watch(loginProvider);
    return Scaffold(
      backgroundColor: myPrimaryColor,
      body: ListView(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: double.infinity,
            height: context.general.isKeyBoardOpen ? 0 : context.sized.dynamicHeight(0.35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/banner.png',
                  height: 125,
                  width: 125,
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Kids Connect',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      'Yönetici Paneli',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 28,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Lütfen Devam Etmek için Giriş Yapınız',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: context.sized.dynamicHeight(0.6),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                appTextField(
                  context: context,
                  text: 'E-posta Adresi: ',
                  icon: Icons.email,
                  hintText: 'Lütfen E-posta adresini Giriniz',
                  onChangedInput: (value) {
                    loginNotifier.setEmail = value;
                  },
                ),
                appTextField(
                  context: context,
                  text: 'Şifre: ',
                  icon: Icons.lock,
                  hintText: 'Lütfen Şifre Giriniz',
                  isPassword: true,
                  isVisible: loginNotifier.textPasswordType,
                  onChangedInput: (value) {
                    loginNotifier.setPassword = value;
                  },
                  visibilityPassword: () {
                    loginNotifier.changeTypePassword();
                  },
                ),
                const SizedBox(height: 20),
                appButton(
                  context: context,
                  buttonText: 'Giriş Yap',
                  icon: Icons.arrow_forward_outlined,
                  onClicked: () async {
                    await loginNotifier.login(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
