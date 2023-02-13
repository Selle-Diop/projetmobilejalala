import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_application_1/screen/Admin/dashbord-screen.dart';

import 'Manage_category.dart';
import 'agentJalala.dart';
import 'agentMairie.dart';
import 'manage_item.dart';

class AdminHome extends StatefulWidget {
  // const AdminHome({super.key});
  static const String id = "admin-home";

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  Widget _selectedScreen = DashbordScreen();
  currentScreen(item) {
    switch (item.route) {
      case DashbordScreen.id:
        setState(() {
          _selectedScreen = DashbordScreen();
        });

        break;
      case ManageCategory.id:
        setState(() {
          _selectedScreen = ManageCategory();
        });

        break;
      case ManageItem.id:
        setState(() {
          _selectedScreen = ManageItem();
        });

        break;
      case AgentJalala.id:
        setState(() {
          _selectedScreen = AgentJalala();
        });

        break;
      case AgentMairie.id:
        setState(() {
          _selectedScreen = AgentMairie();
        });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF008000),
        // shadowColor: Color(0xFF008000),
        // color: Color(0xFF008000),
        title: Center(child: const Text('Admin Panel')),
      ),
      sideBar: SideBar(
        backgroundColor: Color(0xFF008000),
        iconColor: Colors.white,
        textStyle: TextStyle(
          color: Colors.white,
        ),
        items: const [
          AdminMenuItem(
            title: 'Statistiques',
            route: DashbordScreen.id,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Agent',
            route: AgentJalala.id,
            icon: Icons.account_box_rounded,
          ),
          AdminMenuItem(
            title: 'Gestion des Ordures',
            route: ManageCategory.id,
            icon: Icons.delete,
          ),
          AdminMenuItem(
            title: 'Manage item',
            route: ManageItem.id,
            icon: Icons.dashboard,
          ),
        ],

        selectedRoute: AdminHome.id,
        onSelected: (item) {
          currentScreen(item);
          // if (item.route != null) {
          //   Navigator.of(context).pushNamed(item.route!);
          // }
        },
        header: Container(
          height: 90,
          width: double.infinity,
          color: Color(0xFF008000),
          child: Center(
            child: Image.asset(
              'images/logo.png',
              width: 300,
              height: 300,
            ),
          ),
        ),
        // footer: Container(
        //   height: 50,
        //   width: double.infinity,
        //   color: const Color(0xff444444),
        //   child: const Center(
        //     child: Text(
        //       'footer',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: _selectedScreen,
      ),
    );
  }
}
