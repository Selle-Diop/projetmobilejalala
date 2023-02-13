import 'dart:io';
import 'dart:math';
import 'dart:ui';
// import 'package:path/path.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/screen/pageAcceuil.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../services/dataBaseServive.dart';

class pageSignalement extends StatefulWidget {
  const pageSignalement({super.key});

  @override
  State<pageSignalement> createState() => _pageSignalementState();
}

class _pageSignalementState extends State<pageSignalement> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _commentaireController = TextEditingController();
  // DataBaseService dbservice = DataBaseService();

  String commentaire = "";
  int _value = 1;

  File? _pickedImage;
  CollectionReference _signalementRef =
      FirebaseFirestore.instance.collection('signalement');

  String? filename;
  Future captureImage(ImageSource source) async {
    try {
      XFile? file = await ImagePicker().pickImage(source: source);
      if (file == null) return;
      final imageTempory = File(file.path);
      setState(() {
        _pickedImage = imageTempory;
      });
      Navigator.pop(context);
    } on PlatformException catch (e) {
      print('no image picked: $e');
    }
  }

  randu() {
    int min = 10;
    int max = 20;

    int randomnum = min + Random().nextInt((max + 1) - min);
  }

  void removeDialog() {
    setState(() {
      _pickedImage == null;
    });
    Navigator.pop(context);
  }

  enregistrerSignal() async {
    String uniqueFilename = DateTime.now().microsecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirectorImages = referenceRoot.child('signalImages');
    Reference referenceTouploadImage =
        referenceDirectorImages.child(uniqueFilename);
    try {
      await referenceTouploadImage.putFile(File(_pickedImage!.path));
      filename = await referenceTouploadImage.getDownloadURL();
      Map<String, dynamic> dataToSend = {
        'photo': filename,
        'commentaires': _commentaireController.text,
        // 'niveau': _values,
        'type de signalisation': _value,
        'numero commande': Random().nextInt(50),
      };
      _signalementRef.add(dataToSend);
    } on firebase_storage.FirebaseException catch (e) {
      print(e.toString());
    }
  }

  SfRangeValues _values = SfRangeValues(2, 3);

  final ScrollController _firstController = ScrollController();
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
                padding: const EdgeInsets.all(8),
                backgroundColor: const Color(0xFF008000),
                color: Colors.white,
                tabBackgroundColor: const Color.fromARGB(255, 131, 200, 133),
                tabs: [
                  GButton(
                    icon: Icons.home,
                    iconSize: 30,
                    text: 'Acceuil',
                    onPressed: (() => Get.to(pageAcceuil())),
                  ),
                  GButton(
                      icon: Icons.qr_code_scanner,
                      iconSize: 30,
                      onPressed: (() => Get.to(pageSignalement())),
                      text: 'Signaler'),
                  GButton(
                      icon: Icons.newspaper_sharp, iconSize: 30, text: 'Actu'),
                  GButton(
                      icon: Icons.account_circle, iconSize: 30, text: 'Compte')
                ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 80,
                color: Colors.green,
                width: double.infinity,
                child: IconButton(
                  onPressed: (() => Get.to(const pageAcceuil())),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 41,
                  ),
                ),
              ),
              //-------------------------------Formulaire d'envoi-----------------------------
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          height: 300,
                          width: double.infinity,
                          color: Colors.white,
                          child: CircleAvatar(
                            radius: 150,
                            backgroundImage: _pickedImage == null
                                ? AssetImage('images/emptyimage.png')
                                : FileImage(_pickedImage!) as ImageProvider,
                          ),
                        ),
                        Positioned(
                            top: 240,
                            left: 230,
                            child: RawMaterialButton(
                              elevation: 10,
                              fillColor: Colors.green,
                              padding: EdgeInsets.all(15),
                              shape: CircleBorder(),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Choisir une option',
                                          style: GoogleFonts.roboto(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        content: SingleChildScrollView(
                                          child: ListBody(children: [
                                            InkWell(
                                              onTap: () {
                                                captureImage(
                                                    ImageSource.camera);
                                              },
                                              splashColor: Colors.greenAccent,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Icon(
                                                      Icons.camera,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                  Text('Camera',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                captureImage(
                                                    ImageSource.gallery);
                                              },
                                              splashColor: Colors.greenAccent,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Icon(
                                                      Icons.image,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                  Text('Gallery',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.black,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // removeDialog();
                                                Navigator.pop(context);
                                              },
                                              splashColor: Colors.greenAccent,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  Text('Annuler',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.red,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),
                                            ),
                                          ]),
                                        ),
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: 34,
                              ),
                            ))
                      ]),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.green,
                            Color.fromARGB(255, 94, 176, 97),
                          ],
                        )),
                        height: 317,
                        child: Scrollbar(
                          controller: _firstController,
                          thumbVisibility: true,
                          child: ListView(
                            shrinkWrap: true,
                            controller: _firstController,
                            children: [
                              Column(
                                children: [
                                  Text('Type de signalisation',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 2,
                                              color: Color(0xFF008000),
                                            ),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        height: 165,
                                        width: 130,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              child: Text('Dépots sauvages',
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.green,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'images/poubeillle.png',
                                                height: 60,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Radio(
                                                focusColor: Colors.green,
                                                hoverColor: Colors.green,
                                                activeColor: Colors.green,
                                                value: 1,
                                                groupValue: _value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _value = value!;
                                                  });
                                                }),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              child: Text('Dépots saturés',
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.green,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: 13,
                                            ),
                                            Image.asset(
                                              'images/dsauvages.png',
                                              height: 65,
                                              width: 68,
                                              fit: BoxFit.cover,
                                            ),
                                            Radio(
                                                focusColor: Colors.green,
                                                hoverColor: Colors.green,
                                                activeColor: Colors.green,
                                                value: 2,
                                                groupValue: _value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _value = value!;
                                                  });
                                                }),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 2,
                                              color: Color(0xFF008000),
                                            ),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        height: 165,
                                        width: 130,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              child: Text('Encombrant',
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.green,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Image.asset(
                                                'images/encombrant 1.png',
                                                height: 70,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Radio(
                                                focusColor: Colors.green,
                                                hoverColor: Colors.green,
                                                activeColor: Colors.green,
                                                value: 3,
                                                groupValue: _value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _value = value!;
                                                  });
                                                }),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 2,
                                              color: Color(0xFF008000),
                                            ),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        height: 165,
                                        width: 130,
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 8,
                                              ),
                                              child: Text('Cannivaux bouchés',
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.green,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Image.asset(
                                                'images/cannivaux 1.png',
                                                height: 68,
                                                width: 70,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Radio(
                                                focusColor: Colors.green,
                                                hoverColor: Colors.green,
                                                activeColor: Colors.green,
                                                value: 4,
                                                groupValue: _value,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _value = value!;
                                                  });
                                                }),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 2,
                                              color: Color(0xFF008000),
                                            ),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        height: 165,
                                        width: 130,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text('Niveau d\'urgence',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        child: SfRangeSlider(
                                            activeColor: Colors.green,
                                            values: _values,
                                            min: 1,
                                            max: 5,
                                            showLabels: true,
                                            interval: 1,
                                            showTicks: true,
                                            enableTooltip: true,
                                            onChanged: (dynamic newValues) {
                                              setState(() {
                                                _values = newValues;
                                              });
                                            }),
                                        width: double.infinity,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0xFF008000),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          color: Colors.white,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Localisation',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 9,
                                            right: 9,
                                            child: Container(
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                  size: 15,
                                                ),
                                              ),
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF008000),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      width: double.infinity,
                                      height: 151,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Color(0xFF008000),
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Commentaires',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: TextFormField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 6,
                                        controller: _commentaireController,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'le champ ne doit pas etre vide';
                                          }

                                          return null;
                                        },
                                        onChanged: (value) =>
                                            commentaire = value,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1, color: Colors.green),
                                          ),
                                          hintText: 'Description',
                                          // contentPadding: EdgeInsets.zero,
                                        ),
                                      ),
                                      width: double.infinity,
                                      height: 151,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: Color(0xFF008000),
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Visibilté du signal',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: (() {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              print('rr');
                                              // saveSignal();
                                              // saveDechets();
                                            }
                                          }),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Color.fromARGB(255, 2, 109, 2),
                                            padding: const EdgeInsets.all(8.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  bottomLeft:
                                                      Radius.circular(15)),
                                            ),
                                            minimumSize: const Size(140, 44),
                                          ),
                                          child: Text(
                                            'Visible',
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: (() {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              // saveDechets();
                                            }
                                            // Get.to(listeDepots());
                                          }),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            padding: const EdgeInsets.all(8.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15)),
                                            ),
                                            minimumSize: const Size(140, 44),
                                          ),
                                          child: Text(
                                            'Anonyme',
                                            style: GoogleFonts.roboto(
                                                color: Color(0xFF78829D),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        enregistrerSignal();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF008000),
                                      // padding: const EdgeInsets.all(8.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14.0)),
                                      minimumSize: const Size(180, 40),
                                    ),
                                    child: Text(
                                      'Signaler',
                                      style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
