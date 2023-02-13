import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/dataBaseServive.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ManageCategory extends StatefulWidget {
  static const String id = "manage-category";

  @override
  State<ManageCategory> createState() => _ManageCategoryState();
}

class _ManageCategoryState extends State<ManageCategory> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _lieuController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DataBaseService dbservice = DataBaseService();

  String titre = "";
  String lieu = "";
  String description = "";
  String telephone = "";
  String distance = "";
  String? _typedechets;
  var isHover = false;
  dynamic image;
  String? filename;
  clean() {
    setState(() {
      _nameController.clear();
      image = null;
      _telephoneController.clear();
      _distanceController.clear();
      _lieuController.clear();
      _descriptionController.clear();
      _typedechets = null;
    });
  }

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (result != null) {
      setState(() {
        image = result.files.first.bytes;
        filename = result.files.first.name;
      });
    } else {
      print('No Image Selected');
    }
  }

  saveDechets() async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('gs://jalalamaps-374f0.appspot.com/DechetsImages/$filename');
    EasyLoading.show(status: 'Chargement...');
    try {
      // print('hello');
      await ref.putData(image);
      String downloadURL = await ref.getDownloadURL().then((value) {
        if (value.isNotEmpty) {
          dbservice.addDechets(
            reference: dbservice.dechets,
            docName: 'dechets',
            dataD: {
              'Agent': _nameController.text,
              'lieu': _lieuController.text,
              'description': _descriptionController.text,
              'telephone': _telephoneController.text,
              'distance': _distanceController.text,
              'typedechets': _typedechets,
              ' image': value,
              'date': DateTime.now()
            },
          ).then((value) => {
                EasyLoading.dismiss(),
                clean(),
              });
        }
        return value;
      });
    } on firebase_storage.FirebaseException catch (e) {
      print(e.toString());
      clean();
      EasyLoading.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ajouter des Depots D\'ordures',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  ),
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
        Container(
          margin: EdgeInsets.only(left: 239),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: InkWell(
                          onTap: () {
                            pickImage();
                          },
                          child: image == null
                              ? Center(
                                  child: Icon(
                                    Icons.file_upload,
                                    color: Colors.white,
                                  ),
                                )
                              : Image.memory(
                                  image,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFF008000),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 200,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'le champ ne doit pas etre vide';
                                }

                                return null;
                              },
                              onChanged: (value) => titre = value,
                              decoration: InputDecoration(
                                hintText: 'E.g.jonh field',
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _lieuController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'le champ ne doit pas etre vide';
                                }

                                return null;
                              },
                              onChanged: (value) => lieu = value,
                              decoration: InputDecoration(
                                hintText: 'lieu',
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              maxLength: 9,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _telephoneController,
                              decoration: InputDecoration(
                                prefixText: "+",
                                // prefixIcon: Icon(Icons.phone),
                                hintText: 'telephone',

                                contentPadding: EdgeInsets.zero,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'le champ ne doit pas etre vide';
                                }
                                if (value.length < 9) {
                                  return 'Vérifiez l\'écriture de votre numéro ';
                                }

                                return null;
                              },
                              onChanged: (value) => telephone = value,
                            ),
                          ),
                          Container(
                            width: 200,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _distanceController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'le champ ne doit pas etre vide';
                                }

                                return null;
                              },
                              onChanged: (value) => distance = value,
                              decoration: InputDecoration(
                                label: Text('la distance'),
                                contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          Container(
                              width: 200,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  hintText: 'le type de dépots',
                                  border: InputBorder.none,
                                ),
                                value: _typedechets,
                                validator: ((value) {
                                  if (value == null) {
                                    return "le champ ne doit pas etre vide";
                                  }
                                  return null;
                                }),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    _typedechets = value!;
                                  });
                                },
                                items: <String>[
                                  'Déchets Sauvages',
                                  'Déchets Normés',
                                  'Encombrant',
                                  'Cannivaux Bouchés',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )),
                          Container(
                            width: 200,
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              controller: _descriptionController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'le champ ne doit pas etre vide';
                                }

                                return null;
                              },
                              onChanged: (value) => description = value,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.green),
                                ),
                                hintText: 'Description',
                                // contentPadding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              image == null
                                  ? Container()
                                  : ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          saveDechets();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF008000),
                                        // padding: const EdgeInsets.all(8.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14.0)),
                                        minimumSize: const Size(50, 40),
                                      ),
                                      child: Text(
                                        'Enregistrer',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                              SizedBox(
                                width: 10,
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
                                  onPressed: () {
                                    EasyLoading.dismiss();
                                    clean();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        isHover ? Colors.red : Colors.white,
                                    side: BorderSide(
                                        width: 2,
                                        color: isHover
                                            ? Colors.red
                                            : Colors.white),
                                    // padding: const EdgeInsets.all(8.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0)),
                                    minimumSize: const Size(50, 40),
                                  ),
                                  child: Text(
                                    'Annuler',
                                    style: GoogleFonts.roboto(
                                        color: isHover
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )),
        )
        // viewData()
      ],
    );
  }
}
