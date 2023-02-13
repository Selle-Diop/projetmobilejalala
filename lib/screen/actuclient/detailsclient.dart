import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'actuclient.dart';

class detailClient extends StatefulWidget {
  const detailClient({super.key});

  @override
  State<detailClient> createState() => _detailClientState();
}

class _detailClientState extends State<detailClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Stack(children: [
        Image.asset(
          'images/green1.png',
          width: double.infinity,
        ),
        Positioned(
          top: 80,
          left: 10,
          child: Row(
            children: [
              IconButton(
                  onPressed: (() => Get.to(actuClient())),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 41,
                  )),
              SizedBox(
                width: 40,
              ),
              Container(
                margin: EdgeInsets.only(top: 6),
                child: Text(
                  'Details Commandes',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ]),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Agent',
            style: GoogleFonts.roboto(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Text(
            'Téléphone',
            style: GoogleFonts.roboto(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          Text(
            'Action',
            style: GoogleFonts.roboto(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: Container(
                  margin: EdgeInsets.only(left: 19, top: 3),
                  child: Text('issa sall')),
              title: Container(
                  margin: EdgeInsets.only(left: 53),
                  child: Text('77 878 66 78')),
              trailing: Container(
                  margin: EdgeInsets.only(right: 18), child: Text('en route')),
            );
          })),
      SizedBox(
        height: 25,
      ),
      Container(
        margin: EdgeInsets.only(right: 228),
        child: Text('Poubeille',
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400)),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        width: 345,
        height: 140,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0xFF008000),
          ),
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Container(
        margin: EdgeInsets.only(right: 180),
        child: Text('Localisation',
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w400)),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        width: 345,
        height: 140,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0xFF008000),
          ),
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
      ),
    ]));
  }
}
