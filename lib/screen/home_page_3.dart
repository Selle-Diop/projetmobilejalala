import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page_2.dart';
import 'home_page_4.dart';

class homePage_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'images/recompenses.png',
              // color: Color.fromRGBO(0, 0, 0, 0.2865),
              // colorBlendMode: BlendMode.softLight,
            ),

            // ignore: avoid_unnecessary_containers
            Container(
              margin: const EdgeInsets.only(top: 40),
              // child: Image.asset('images/Dechets.png'),
              child: Image.asset('images/logo.png'),
            ),
          ],
        ),
        Card(
            margin: const EdgeInsets.only(bottom: 10),
            elevation: 4,
            shadowColor: Colors.white, // Change this
            // shadowColor: Color.fromARGB(210, 255, 255, 255),
            // color: Colors.red,
            child: SizedBox(
                width: 336,
                height: 400,
                child: Container(

                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        // const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.only(top: 28, right: 24),
                          child: Text(
                            'Recevez des récompenses',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 28, right: 215),
                          width: 82,
                          decoration: const BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      color: Colors.black, width: 3))),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 28),
                          child: Text(
                            'Faites un bon tri et vous serez récompenser. Il vous suffit de respecter les consignes de tri.',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 28),
                          width: 81,
                          height: 8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color.fromRGBO(
                                      231, 241, 255, 0.906),
                                ),
                              ),
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color.fromRGBO(
                                      231, 241, 255, 0.906),
                                ),
                              ),
                              Container(
                                width: 25,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 28),
                        Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Hover_Class(),
                                  hoverClass(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))))
      ]),
    );
  }

  MouseRegion hoverClass() {
    return MouseRegion(
      child: ElevatedButton(
        onPressed: () => Get.to(connexion_inscription()),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 5, 119, 9),
          padding: const EdgeInsets.all(13.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
          minimumSize: const Size(130, 10),
        ),
        child: Text(
          'Démarrer',
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class Hover_Class extends StatefulWidget {
  const Hover_Class({super.key});

  @override
  State<Hover_Class> createState() => _Hover_ClassState();
}

class _Hover_ClassState extends State<Hover_Class> {
  var isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHover = false;
        });
      },
      child: ElevatedButton(
        onPressed: () => Get.to(MyHome_Page_2()),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF9F9FB),
          side: BorderSide(
              width: 1, color: isHover ? Colors.green : Color(0xFFA6B3B4)),
          padding: const EdgeInsets.all(13.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
          minimumSize: const Size(130, 10),
        ),
        child: Text(
          'Précédent',
          style: GoogleFonts.roboto(
              color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
