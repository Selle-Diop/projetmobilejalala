import 'package:get/get.dart';

import '../screen/authentification/page_connexion.dart';
import '../screen/authentification/page_inscription.dart';
import '../screen/home_page_1.dart';
import '../screen/home_page_2.dart';
import '../screen/home_page_3.dart';
import '../screen/home_page_4.dart';
import '../screen/pageAcceuil.dart';

appRoutes() => [
      GetPage(name: '/home', page: () => homePage_1()),
      GetPage(name: '/page2', page: () => MyHome_Page_2()),
      GetPage(name: '/page3', page: () => homePage_3()),
      GetPage(name: '/page4', page: () => connexion_inscription()),
      GetPage(name: '/page_connexion', page: () => page_connexion()),
      GetPage(name: '/page_inscription', page: () => page_inscription()),
      GetPage(name: '/page_acceuil', page: () => pageAcceuil()),
    ];
