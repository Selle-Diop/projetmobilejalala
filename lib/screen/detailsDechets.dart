import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'liste_carte.dart';

class detailsDechets extends StatelessWidget {
  final CardItem item;

  detailsDechets({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            // alignment: Alignment.center,
            children: [
              Container(
                // height: 783,
                child: Image.asset(
                  'images/greenDetails.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 433,
                ),
              ),
              Positioned(
                top: 55,
                left: 15,
                child: Row(children: [
                  IconButton(
                      onPressed: (() => Get.to(listeDepots())),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 41,
                      )),
                  SizedBox(
                    width: 64,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      item.title,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ]),
              ),
              Positioned(
                top: 115,
                left: 17,
                child: Container(
                  width: 360,
                  height: 220,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      item.urlImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 358,
                left: 45,
                child: Container(
                    // width: 360,
                    // height: 220,

                    child: Row(children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: 19,
                  ),
                  Text(item.lieu,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400))
                ])),
              ),
            ],
          ),
          // Detail_Description(item: item,),
          Container(
            child: Column(
              children: [
                Text('Details Du Dépot',
                    style: GoogleFonts.roboto(
                        color: Color(0xFF008000),
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                Container(
                  // color: Colors.green,
                  margin: EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Signaleur :',
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                          SizedBox(
                            width: 125,
                          ),
                          Text(item.signaleur,
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Heure du  depot :',
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                          Text(item.heureDepot,
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Date du deopt :',
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                          Text(item.dateDepot,
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text('Telephone :',
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF000000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          ),
                          Text(item.telephone,
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 205),
                            child: Text('Description :',
                                style: GoogleFonts.roboto(
                                    color: Color(0xFF000000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(item.description,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                  color: Color(0xFF000000),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
