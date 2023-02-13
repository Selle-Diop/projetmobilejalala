import 'package:cloud_firestore/cloud_firestore.dart';

class Dechets {
  String? dechetsID,
      dechetsSignaleur,
      dechetsUserID,
      dechetsUrlImage,
      dechetsTitle,
      telephone,
      dechetsDescription,
      dechetsLieu,
      dechetsmiles;
  // DateTime? dechetsTimestamp;
  Dechets({
    this.dechetsID,
    this.dechetsSignaleur,
    this.dechetsUserID,
    this.dechetsUrlImage,
    this.dechetsTitle,
    this.telephone,
    this.dechetsDescription,
    this.dechetsLieu,
    this.dechetsmiles,
    // this.dechetsTimestamp,
  });
}

class Utilisateurs {
  String? uid, nomComplet, email, telephone, typeAgent, password;
  DateTime? date;
  Utilisateurs(
      {this.uid,
      this.password,
      this.nomComplet,
      this.date,
      this.email,
      this.telephone,
      this.typeAgent});
}
