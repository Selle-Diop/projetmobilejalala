import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../model/dechetsModels.dart';

class DataBaseService {
  // declaration et initialisation
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseStorage _storage = FirebaseStorage.instance;
  CollectionReference dechets =
      FirebaseFirestore.instance.collection('Dechets');
  CollectionReference signalement =
      FirebaseFirestore.instance.collection('signalement');
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<String> uploadfile(file) async {
    Reference reference = _storage.ref().child('Dechets/${DateTime.now()}.png');
    UploadTask uploadTask = reference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  // Future<void> insertImage(XFile file) async {
  //   File _file = File(file.path);
  //   firebase_storage.Reference ref =
  //       FirebaseStorage.instance.ref('users/{$user.uid}');
  //   await ref.putFile(_file);
  // }
  Future<void> signaler(
      {required CollectionReference reference,
      required Map<String, dynamic> dataD,
      required String docName}) {
    return reference.doc(docName).set(dataD);
  }

  void addDecs(Dechets dechet) {
    dechets.add({
      "dechetsSignaleur": dechet.dechetsSignaleur,
      "dechetsUserID": dechet.dechetsUserID,
      " dechetsUrlImage": dechet.dechetsUrlImage,
      "dechetsTitle": dechet.dechetsTitle,
      " telephone": dechet.telephone,
      "dechetsDescription": dechet.dechetsDescription,
      "dechetsLieu": dechet.dechetsLieu,
      " dechetsmiles": dechet.dechetsmiles,
      "dechetsTimestamp": FieldValue.serverTimestamp(),
    });
  }

  Future<void> addDechets(
      {required CollectionReference reference,
      required Map<String, dynamic> dataD,
      required String docName}) {
    return reference.doc(docName).set(dataD);
  }

  Future addUtilisateurs(Utilisateurs utilisateur) async {
    await users.add({
      "uid": utilisateur.uid,
      "nom complet": utilisateur.nomComplet,
      "email": utilisateur.email,
      "telephone": utilisateur.telephone,
      "agent": utilisateur.typeAgent,
      "date": DateTime.now(),
      "password": utilisateur.password,
    });
  }

  Future<void> addUser({required Map<String, dynamic> data}) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(user?.uid)
        .set(data)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Stream<List<Utilisateurs>> get getutilisateurs {
    Query queryUsers = users.orderBy("date", descending: true);
    return queryUsers.snapshots().map((snapshot) {
      return snapshot.docs.map((docs) {
        // return _users.doc(user?.uid).get(data);
        return Utilisateurs(
          // Userid:docs.id,
          uid: docs.id,
          nomComplet: docs.get("nom complet"),
          email: docs.get('email'),
          telephone: docs.get('telephone'),
          typeAgent: docs.get('agent'),
          password: docs.get('password'),
          date: docs.get('date'),
        );
      }).toList();
    });
  }
}
