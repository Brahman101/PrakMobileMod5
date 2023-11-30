import 'package:get/get.dart';
import 'package:modul3prak/app/modules/home/views/account_page.dart';
import 'package:modul3prak/app/modules/home/views/appwrite_account.dart';
import 'package:modul3prak/app/modules/home/views/facts_view.dart';
import 'package:modul3prak/app/modules/home/views/home_view.dart';
import 'package:modul3prak/app/modules/home/views/img_review.dart';

import 'package:modul3prak/app/modules/home/views/instagram_view.dart';
import 'package:modul3prak/app/modules/home/views/login_page%20.dart';
import 'package:modul3prak/app/modules/home/views/register_page.dart';

class RoutesClass {
  static String home = '/';
  static String facts = '/facts';
  static String account = '/account';
  static String instagram = '/instagram';
  static String register = '/register';
  static String login = '/login';
  static String test = '/test';

  static String getHomeRoute() => home;
  static String getFactsRoute() => facts;
  static String getAccountRoute() => account;
  static String getInstagramRoute() => instagram;
  static String getRegisterRoute() => register;
  static String getLoginRoute() => login;
  static String getTestRoute() => test;

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomeView(),
    ),
    GetPage(name: facts, page: () => FactsView()),
    GetPage(name: instagram, page: () => InstagramView()),
    GetPage(name: register, page: () => RegisterPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(
      name: account,
      page: () => Accountpage(),
    ),
    GetPage(name: test, page: () => TestAccountView())
  ];
}
