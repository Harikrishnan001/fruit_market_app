import 'package:flutter/material.dart';
import 'package:fruit_market_app/screens/main_page.dart';
import '/screens/account_setting_screen.dart';
import '/screens/favourites_screen.dart';
import '/screens/help_screen.dart';
import '/screens/intro_screen.dart';
import '/screens/language_settings_screen.dart';
import '/screens/loading_screen.dart';
import '/screens/login_screen.dart';
import '/screens/mobile_verfication_screen.dart';
import '/screens/my_account_screen.dart';
import '/screens/my_orders_screen.dart';
import '/screens/notification_screen.dart';
import '/screens/notification_settings.dart';
import '/screens/settings_screen.dart';
import '/screens/user_info_screen.dart';
import '/screens/change_address_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AccountSettingScreen.routeName: (_) => const AccountSettingScreen(),
        ChangeAddressScreen.routeName: (_) => const ChangeAddressScreen(),
        FavouritesScreen.routeName: (_) => const FavouritesScreen(),
        IntroScreen.routeName: (_) => const IntroScreen(),
        LanguageSettingsScreen.routeName: (_) => const LanguageSettingsScreen(),
        LoadingScreen.routeName: (_) => const LoadingScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        MobileVerificationScreen.routeName: (_) =>
            const MobileVerificationScreen(),
        MyAccountScreen.routeName: (_) => const MyAccountScreen(),
        MyOrdersScreen.routeName: (_) => const MyOrdersScreen(),
        NotificationScreen.routeName: (_) => const NotificationScreen(),
        NotificationSettingScreen.routeName: (_) => const NotificationScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
        UserInfoScreen.routeName: (_) => const UserInfoScreen(),
        HelpScreen.routeName: (_) => const HelpScreen(),
      },
      home: const MainPage(),
    );
  }
}
