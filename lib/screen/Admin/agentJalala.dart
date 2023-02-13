import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/dechetsModels.dart';
import 'package:flutter_application_1/screen/Admin/viewData.dart';
import 'package:flutter_application_1/services/dataBaseServive.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';
import 'package:image_picker/image_picker.dart';

class AgentJalala extends StatefulWidget {
  static const String id = "AgentJalala";

  @override
  State<AgentJalala> createState() => _AgentJalalaState();
}

class _AgentJalalaState extends State<AgentJalala> {
  final ImagePicker _picker = ImagePicker();
  String? _typeAgent;
  String email = '';
  String password = '';
  String nomComplet = '';
  String telephone = '';
  bool isEmailCorrcet = false;
  final _formKey = GlobalKey<FormState>();
  DataBaseService _dataBaseService = DataBaseService();
  File? _image;
  _getImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      this._image = File(pickedImage.path);
    } else {
      print('no image selected');
    }
    return _image;
  }

  // final TextEditingController _textEditingController = TextEditingController();
  // final TextEditingController _textEditingPassword = TextEditingController();
  Future<void> showModal(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          final TextEditingController _nameController = TextEditingController();
          final TextEditingController _telephoneController =
              TextEditingController();

          final TextEditingController _textEditingController =
              TextEditingController();
          final TextEditingController _textEditingPassword =
              TextEditingController();
          return StatefulBuilder(builder: ((context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Stack(children: [
                          //   Container(
                          //       // margin: EdgeInsets.only(top: 48),
                          //       // height: 300,
                          //       // decoration: BoxDecoration(
                          //       //   color: Colors.white,
                          //       //   borderRadius: BorderRadius.circular(16.0),
                          //       // ),
                          //       ),
                          //   Align(
                          //       alignment: Alignment.topCenter,
                          //       child: SizedBox(
                          //         child: CircleAvatar(
                          //           radius: 25.0,
                          //           backgroundColor: Colors.white,
                          //           child: CircleAvatar(
                          //             child: Align(
                          //               alignment: Alignment.bottomRight,
                          //               child: CircleAvatar(
                          //                 backgroundColor: Colors.transparent,
                          //                 radius: 12.0,
                          //                 child: IconButton(
                          //                   color: Color(0xFF404040),
                          //                   icon: Icon(
                          //                     Icons.camera_alt,
                          //                     size: 20.0,
                          //                   ),
                          //                   onPressed: () {
                          //                     // if (_image == null) {
                          //                     //   ScaffoldMessenger.of(context)
                          //                     //       .showSnackBar(
                          //                     //           const SnackBar(
                          //                     //     content: Text('pas image'),
                          //                     //     backgroundColor: Colors.red,
                          //                     //   ));
                          //                     // }
                          //                     _getImage().then((value) {
                          //                       setState(() {
                          //                         value = _image;
                          //                       });
                          //                     });
                          //                   },
                          //                 ),
                          //               ),
                          //             ),
                          //             radius: 38.0,
                          //             backgroundImage: _image == null
                          //                 ? AssetImage('images/profileuser.png')
                          //                 : FileImage(_image!) as ImageProvider,
                          //           ),
                          //         ),
                          //       )),
                          // ]),
                          Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Text(
                              'Nom Complet',
                              style: GoogleFonts.roboto(
                                  color: const Color(0xFF38385E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                           
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _nameController,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: isEmailCorrcet == false
                                              ? Colors.red.shade200
                                              : Colors.green.shade200,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  hintText: 'E.g. John Smith',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 13, color: Color(0xFF9BA2B1))),
                              // obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'le champ ne doit pas etre vide';
                                }

                                return null;
                              },
                              onChanged: (value) => nomComplet = value,
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Text(
                              'Telephone',
                              style: GoogleFonts.roboto(
                                  color: const Color(0xFF38385E),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            // height: 50,
                            // width: 264,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _telephoneController,
                              decoration: InputDecoration(
                                  prefixText: "+",
                                  prefixIcon: Icon(Icons.phone),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: isEmailCorrcet == false
                                              ? Colors.red.shade200
                                              : Colors.green.shade200,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  hintText: 'telephone',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 13, color: Color(0xFF9BA2B1))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'le champ ne doit pas etre vide';
                                }
                                if (value.length < 10) {
                                  return 'Vérifiez l\'écriture de votre numéro ';
                                }

                                return null;
                              },
                              onChanged: (value) => telephone = value,
                            ),
                          ),
                          // SizedBox(
                          //   height: 1,
                          // ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Text(
                              'Type d\'Agent',
                              style: GoogleFonts.roboto(
                                  color: const Color(0xFF38385E),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 8),

                              // height: 50,
                              // width: 264,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: isEmailCorrcet == false
                                                ? Colors.red.shade200
                                                : Colors.green.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(15.0))),
                                value: _typeAgent,
                                validator: ((value) {
                                  if (value == null) {
                                    return "le champ ne doit pas etre vide";
                                  }
                                  return null;
                                }),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    _typeAgent = value!;
                                  });
                                },
                                items: <String>[
                                  'Agent Jalala Maps',
                                  'Agent Municipal'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )),
                        
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Text(
                              'Email',
                              style: GoogleFonts.roboto(
                                  color: const Color(0xFF38385E),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            // height: 50,
                            // width: 264,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _textEditingController,
                                showCursor: true,
                                onChanged: (value) {
                                  email = value;
                                  setState(() {
                                    isEmailCorrcet = isEmail(value);
                                  });
                                },
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: isEmailCorrcet == false
                                                ? Colors.red.shade200
                                                : Colors.green.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade200,
                                            width: 2),
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    // border: InputBorder.none,
                                    hintText: 'Jonh@gmail.com',
                                    border: InputBorder.none,
                                    hintStyle: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF9BA2B1))),
                                validator: (value) {
                                  if (isEmailCorrcet == false) {
                                    if (value == null || value.isEmpty) {
                                      return 'le champ ne doit pas etre vide';
                                    }
                                    return 'verifiez l\'ecriture de votre email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 1.0,
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 6),
                            child: Text(
                              'Mot de Passe',
                              style: GoogleFonts.roboto(
                                  color: const Color(0xFF38385E),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            // height: 50,
                            // width: 264,
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _textEditingPassword,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: isEmailCorrcet == false
                                              ? Colors.red.shade200
                                              : Colors.green.shade200,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200,
                                          width: 2),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  hintText: 'Your password',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontSize: 13, color: Color(0xFF9BA2B1))),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.length < 6) {
                                  return 'Entrer minimun 6 caractéres';
                                }

                                return null;
                              },
                              onChanged: (value) => password = value,
                            ),
                          ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                        ],
                      ),
                    ],
                  )),
              actions: [
                Container(
                  
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          EasyLoading.show(status: 'loading...');
                          _dataBaseService.addUtilisateurs(Utilisateurs(
                            password: password,
                            nomComplet: nomComplet,
                            telephone: telephone,
                            email: email,
                            typeAgent: _typeAgent,
                            // date: DateTime.now(),
                          ));
                          // print("$email   $password");
                          // _dataBaseService.addUser(data: {
                          //   "nom complet": nomComplet,
                          //   "email": email,
                          //   "telephone": telephone,
                          //   "agent": _typeAgent,
                          //   "password": password,
                          //   "uid": _dataBaseService.user?.uid,
                          //   "date": DateTime.now(),
                          // });

                          EasyLoading.dismiss();
                          Navigator.of(context).pop();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF008000),
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        minimumSize: const Size(264, 50),
                      ),
                      child: Text(
                        'Ajouter',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }));
        });
  }

  // bool isEmailCorrcet = false;
  @override
  void dispose() {
    // _textEditingController.dispose();
    // _textEditingPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  var isHover = false;
  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Ajouter un Agent',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  MouseRegion(
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
                      onPressed: () async {
                        await showModal(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(
                            width: 2,
                            color: isHover ? Colors.green : Colors.white),
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13.0)),
                        minimumSize: const Size(230, 59),
                      ),
                      child: Text(
                        'Ajouter',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  )
                ],
              ),
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF008000)),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.shade900,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 3.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow
                    BoxShadow(
                      // color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ),
                  ]),
            ),
          ),
        ),
       
        viewData()
      ],
    );
  }
}


