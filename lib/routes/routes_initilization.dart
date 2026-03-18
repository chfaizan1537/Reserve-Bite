

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:reservebite/routes/routes_names.dart';
import 'package:reservebite/views/admin/admin_home_view.dart';
import 'package:reservebite/views/admin/admin_login_view.dart';
import 'package:reservebite/views/role_view.dart';
import 'package:reservebite/views/user/resturant_detail_view.dart';
import 'package:reservebite/views/user/user_book_table_view.dart';
import 'package:reservebite/views/user/user_login_view.dart';
import 'package:reservebite/views/user/user_see_reservations.dart';
import 'package:reservebite/views/user/user_signup_view.dart';

import '../views/resturants/resturant_home_view.dart';
import '../views/resturants/resturant_login_view.dart';
import '../views/splash_view.dart';
import '../views/user/user_home_view.dart';

class RoutesInitilization {
  static final pages = [
    GetPage(name: RoutesNames.splash, page: () => SplashScreen()),
    GetPage(name: RoutesNames.rolescreen, page: () => Rolescreen(),),
    // --------------------------------
    //  resturants routes
    GetPage(name: RoutesNames.resturantLogin, page: () => ResturantLoginView(),),
    GetPage(name: RoutesNames.resturantHomeScreen, page: () => ReservationHomeView(),),
   // admin routes
   GetPage(name: RoutesNames.adminloginscreen, page:() =>  AdminLoginView(),),
    GetPage(name: RoutesNames.adminhomescreen, page: () => AdminHomeView(),),
    // GetPage(name: RoutesNames.addresturantscreen, page: () => AddResturantView(),),

   //user routes
    GetPage(name: RoutesNames.userlogin, page: () => UserLoginView(),),
    GetPage(name: RoutesNames.usersignup, page: () => UserSignupView(),),
    GetPage(name: RoutesNames.userhomescreen, page: () =>UserHomeView(),),
    GetPage(name: RoutesNames.resturantdetail, page: () => ResturantDetailView(),),
    GetPage(name: RoutesNames.userbooktable, page: ()=>UserBookTableView()),
    GetPage(name: RoutesNames.userSeeReser, page: ()=>UserSeeReservations())


  ];
}
