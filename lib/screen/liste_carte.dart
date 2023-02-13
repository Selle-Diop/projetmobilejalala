import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screen/pageAcceuil.dart';
import 'package:flutter_application_1/screen/page_signalement.dart';
import 'package:flutter_application_1/screen/widgetReusable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'depots_carte.dart';
import 'detailsDechets.dart';

class listeDepots extends StatefulWidget {
  const listeDepots({super.key});

  @override
  State<listeDepots> createState() => _listeDepotsState();
}

class _listeDepotsState extends State<listeDepots> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Color(0xFF008000),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
              gap: 8,
              onTabChange: (index) {
                print(index);
              },
              padding: const EdgeInsets.all(8.13),
              backgroundColor: const Color(0xFF008000),
              // backgroundColor: Color.fromARGB(255, 1, 70, 3),
              color: Colors.white,
              // activeColor: Colors.white,
              tabBackgroundColor: const Color.fromARGB(255, 131, 200, 133),
              tabs: [
                GButton(
                  onPressed: (() => Get.to(pageAcceuil())),
                  icon: Icons.home,
                  iconSize: 30,
                  text: 'Acceuil',
                ),
                GButton(
                    icon: Icons.qr_code_scanner,
                    iconSize: 30,
                    text: 'Signaler'),
                GButton(
                    icon: Icons.newspaper_sharp, iconSize: 30, text: 'Actu'),
                GButton(
                    icon: Icons.account_circle, iconSize: 30, text: 'Compte')
              ]),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text('Bienvenue  ${user?.email}'),
          ListeDepots(),
          // ListeView()
        ],
      ),
    );
  }
}

class ListeDepots extends StatefulWidget {
  const ListeDepots({super.key});

  @override
  State<ListeDepots> createState() => _ListeDepotsState();
}

class _ListeDepotsState extends State<ListeDepots> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 45),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: (() {
                        onTap:
                        Get.to(depotsCarte());
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        minimumSize: const Size(140, 44),
                      ),
                      child: Text(
                        'Carte',
                        style: GoogleFonts.roboto(
                            color: Color(0xFF78829D),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (() {
                        onTap:
                        Get.to(listeDepots());
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 2, 109, 2),
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        minimumSize: const Size(140, 44),
                      ),
                      child: Text(
                        'Liste',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              height: 697,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFF008000)),
            ),
            Positioned(
                top: 110,
                // left: 110,
                child: Container(
                  child: ListeView(),
                  height: 585,
                  width: 393,
                  decoration: BoxDecoration(color: Color(0xFF008000)),
                )),
            Positioned(
                bottom: 15,
                right: 15,
                child: Container(
                  child: IconButton(
                    onPressed: () {
                      Get.to(pageSignalement());
                    },
                    icon: Icon(
                      Icons.add,
                      size: 50,
                      color: Color(0xFF008000),
                    ),
                  ),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ))
          ]),
        ],
      ),
    );
  }
}

class CardItem {
  final String urlImage;
  final String title;
  final String timedate;
  final String miles;
  final Widget child;
  final String lieu;
  final String signaleur;
  final String heureDepot;
  final String dateDepot;
  final String telephone;
  final String description;

  CardItem({
    required this.urlImage,
    required this.title,
    required this.timedate,
    required this.miles,
    required this.child,
    this.lieu = '',
    this.description = '',
    this.telephone = '',
    this.dateDepot = '',
    this.heureDepot = '',
    this.signaleur = '',
  });
}

class ListeView extends StatefulWidget {
  const ListeView({super.key});

  @override
  State<ListeView> createState() => _ListeViewState();
}

class _ListeViewState extends State<ListeView> {
  List<CardItem> items = [
    CardItem(
        urlImage: 'images/essai1.png',
        title: 'Dépots sauvages',
        timedate: '12:20 am on 02/11/2021',
        miles: '06 km',
        lieu: 'Liberté 4, Dakar, CA, 11100',
        child: Icon(color: Colors.white, Icons.arrow_circle_right_outlined),
        signaleur: 'Séllé Diop',
        heureDepot: '02:00 am',
        dateDepot: '12/12/2021',
        telephone: '77 765 54 12',
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque animi, doloremque, impedit illum at ea inventore modi non repellat esse pariatur hic obcaecati porro quae fugiat quia quis quibusdam deleniti?'),
    CardItem(
        urlImage: 'images/dechets4.jpg',
        title: 'Dépots sauvages',
        timedate: '15:50 am on 16/02/2021',
        miles: '05 km',
        lieu: 'Nord Foire, Dakar, CA, 11100',
        child: Icon(color: Colors.white, Icons.arrow_circle_right_outlined),
        signaleur: 'Moussa Fall',
        heureDepot: '02:00 am',
        dateDepot: '12/12/2021',
        telephone: '77 765 54 12',
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque animi, doloremque, impedit illum at ea inventore modi non repellat esse pariatur hic obcaecati porro quae fugiat quia'),
    CardItem(
        urlImage: 'images/dechets5.jpg',
        title: 'Dépots sauvages',
        timedate: '18:30 am on 30/10/2021',
        miles: '09 km',
        lieu: 'HLm, Dakar, CA, 11100',
        child: Icon(color: Colors.white, Icons.arrow_circle_right_outlined),
        signaleur: 'Modou Pouye',
        heureDepot: '02:00 am',
        dateDepot: '12/12/2021',
        telephone: '77 765 54 12',
        description:
            'Lorem ipsum dol elit. Cumque animi, doloremque, impedit il'),
    CardItem(
        urlImage: 'images/depotSauvage.jpeg',
        title: 'Dépots sauvages',
        timedate: '2:00 am on 01/09/2021',
        miles: '03 km',
        lieu: 'Fass, Dakar, CA, 11100',
        child: Icon(color: Colors.white, Icons.arrow_circle_right_outlined),
        signaleur: 'Modou Pouye',
        heureDepot: '02:00 am',
        dateDepot: '12/12/2021',
        telephone: '77 765 54 12',
        description:
            'Lorem ipsum dol elit. Cumque animi, doloremque, impedit il'),
    CardItem(
        urlImage: 'images/depotSauvage.jpeg',
        title: 'Dépots sauvages',
        timedate: '23:50 am on 12/12/2021',
        miles: '10 km',
        lieu: 'Parcelles, Dakar, CA, 11100',
        child: Icon(color: Colors.white, Icons.arrow_circle_right_outlined),
        signaleur: 'Modou Pouye',
        heureDepot: '02:00 am',
        dateDepot: '12/12/2021',
        telephone: '77 765 54 12',
        description:
            'Lorem ipsum dol elit. Cumque animi, doloremque, impedit il'),
    CardItem(
        urlImage: 'images/essai1.png',
        title: 'Dépots sauvages',
        timedate: '14:10 am on 12/12/2021',
        miles: '09 km',
        lieu: 'Fann, Dakar, CA, 11100',
        child: Icon(color: Colors.white, Icons.arrow_circle_right_outlined),
        signaleur: 'Modou Pouye',
        heureDepot: '02:00 am',
        dateDepot: '12/12/2021',
        telephone: '77 765 54 12',
        description:
            'Lorem ipsum dol elit. Cumque animi, doloremque, impedit il'),
    CardItem(
        urlImage: 'images/essai1.png',
        title: 'Dépots sauvages',
        timedate: '21:20 am on 12/12/2021',
        miles: '1.6 km',
        lieu: 'Mariste, Dakar, CA, 11100',
        child: Icon(color: Colors.white, Icons.arrow_circle_right_outlined),
        signaleur: 'Modou Pouye',
        heureDepot: '02:00 am',
        dateDepot: '12/12/2021',
        telephone: '77 765 54 12',
        description:
            'Lorem ipsum dol elit. Cumque animi, doloremque, impedit il'),
  ];
  // final List _posts = [
  //   'post 1',
  //   'post 2',
  //   'post 3',
  //   'post 4',
  //   'post 5',
  //   'post 6',
  //   'post 7',
  // ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 7,
      itemBuilder: (context, index) {
        // return ContainerView(child: _posts[index],);
        return ContainView(item: items[index]);
      },
      separatorBuilder: (BuildContext context, _) => SizedBox(
        height: 0,
      ),
    );
  }

  Widget ContainView({required CardItem item}) => Padding(
        padding: EdgeInsets.all(13),
        child: Container(
          child: Row(children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Padding(
                padding: EdgeInsets.all(18),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    item.urlImage,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 18),
                    child: Text(
                      item.title,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 28,
                ),
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      Text(item.timedate,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 89),
                        child: Text(item.miles,
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                height: 90,
                width: 40,
                // color: Colors.red,
                child: IconButton(
                  // iconSize: 34,
                  icon: item.child,
                  onPressed: () {
                    Get.to(detailsDechets(
                      item: item,
                    ));
                  },
                ))
          ]),
          height: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 22, 156, 22)),
        ),
      );
}
