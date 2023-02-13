import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/dataBaseServive.dart';

class DashbordScreen extends StatelessWidget {
  static const String id = "dashbord-screen";
  DataBaseService _serviceDB = DataBaseService();

  @override
  Widget build(BuildContext context) {
    Widget cardDashbord({String? title, String? value, Widget? Icon}) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF008000)),
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.shade900,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Text(
                  title!,
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 21),
                      child: Text(value!,
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(margin: EdgeInsets.only(top: 21), child: Icon),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _serviceDB.users.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF008000)),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green.shade900,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ));
                }
                if (snapshot.hasData) {
                  return cardDashbord(
                      title: 'Utilisateurs',
                      value: snapshot.data?.size.toString(),
                      Icon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ));
                }
                return SizedBox();
              },
            ),
            cardDashbord(
                title: 'Nettoyages',
                value: '0',
                Icon: Icon(
                  Icons.check_circle_outline,
                  color: Colors.white,
                )),
            cardDashbord(
                title: 'Signalisations',
                value: '0',
                Icon: Icon(
                  Icons.where_to_vote_outlined,
                  color: Colors.white,
                )),
            cardDashbord(
                title: 'Programation',
                value: '0',
                Icon: Icon(
                  Icons.where_to_vote_outlined,
                  color: Colors.white,
                )),
          ],
        )
      ],
    );
  }
}
