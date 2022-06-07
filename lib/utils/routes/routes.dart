import 'package:get/get.dart';
import 'package:photolocation/views/home_screen.dart';
import 'package:photolocation/views/tabs/photo_view_screen.dart';

import '../../views/tabs/location_screen.dart';
import '../../views/splash_screen.dart';

class Routes {
  static String splash = '/';

  static String login = '/login';
  static String home = '/home';
  static String locationScreen = '/locationScreen';

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: locationScreen,
      page: () => LocationShowerScreen(),
    ),
  ];
}
