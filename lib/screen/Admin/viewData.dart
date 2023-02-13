import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/dechetsModels.dart';
import 'package:flutter_application_1/services/dataBaseServive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class viewData extends StatefulWidget {
  const viewData({super.key});

  @override
  State<viewData> createState() => _viewDataState();
}

class _viewDataState extends State<viewData> {
  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('users').snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                      child: DataTable(
                          columns: [
                        DataColumn(
                            label: Text('Nom Complet'),
                            tooltip: 'Le nom des Users'),
                        DataColumn(
                            label: Text('Agent'), tooltip: 'Le nom des Agents'),
                        DataColumn(
                            label: Text('Telephone'),
                            tooltip: 'Le numero des Users'),
                        DataColumn(
                            label: Text('Email'), tooltip: 'Le nom de Email'),
                        DataColumn(
                            label: Text('Action'), tooltip: 'Etat des Actions'),
                      ],
                          rows: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;
                            return DataRow(cells: [
                              DataCell(Text(data['nom complet'])),
                              DataCell(Text(data['agent'])),
                              DataCell(Text(data['telephone'])),
                              DataCell(Text(data['email'])),
                              DataCell(
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF008000),
                                    side: BorderSide(
                                        width: 2, color: Color(0xFF008000)),
                                    // padding: const EdgeInsets.all(8.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0)),
                                    minimumSize: const Size(30, 30),
                                  ),
                                  child: Text(
                                    'Disponible',
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ]);
                          }).toList()))),
            ],
          );
          return Container(
            height: 500,
            width: 900,
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['email']),
                  subtitle: Text(data['password']),
                );
              }).toList(),
            ),
          );
        });
  }
}
