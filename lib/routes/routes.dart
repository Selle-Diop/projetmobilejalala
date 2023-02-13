import 'package:get/get.dart';

import '../screen/Admin/Manage_category.dart';
import '../screen/Admin/adminHome.dart';
import '../screen/Admin/dashbord-screen.dart';
import '../screen/Admin/manage_item.dart';
import '../screen/actuclient/actuclient.dart';
import '../screen/actuclient/detailsclient.dart';
import '../screen/authentification/page_connexion.dart';
import '../screen/authentification/page_inscription.dart';
import '../screen/depots_carte.dart';
import '../screen/detailsDechets.dart';
import '../screen/home_page_1.dart';
import '../screen/home_page_2.dart';
import '../screen/home_page_3.dart';
import '../screen/home_page_4.dart';
import '../screen/liste_carte.dart';
import '../screen/pageAcceuil.dart';
import '../screen/page_signalement.dart';

appRoutes() => [
      GetPage(name: '/home', page: () => homePage_1()),
      GetPage(name: '/page2', page: () => MyHome_Page_2()),
      GetPage(name: '/page3', page: () => homePage_3()),
      GetPage(name: '/page4', page: () => connexion_inscription()),
      GetPage(name: '/page_connexion', page: () => page_connexion()),
      GetPage(name: '/page_inscription', page: () => const page_inscription()),
      GetPage(name: '/page_acceuil', page: () => const pageAcceuil()),
      GetPage(name: '/depots_carte', page: () => const depotsCarte()),
      GetPage(name: '/liste_depots', page: () => const listeDepots()),
      GetPage(name: '/page_signalement', page: () => const pageSignalement()),
      GetPage(name: '/actu_client', page: () => const actuClient()),
      GetPage(name: '/detail_client', page: () => detailClient()),

      //-----Routes AdminPanel-------------------
      GetPage(name: '/adminHome', page: () => AdminHome()),
      GetPage(name: '/ManageItem.id', page: () => ManageItem()),
      GetPage(name: '/ManageCategory.id', page: () => ManageCategory()),
      // GetPage(name: '/DashbordScreen.id', page: () => DashbordScreen()),

      // GetPage(name: '/details_dechets', page: () =>  detailsDechets(item: item,)),
    ];
