import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dostapp/model/members.dart';

class FirebaseApi{
  static Future<String> createMembers(Members members)async{
    final docMem=FirebaseFirestore.instance.collection('Members').doc();
    members.memId=docMem.id;
    await docMem.set(members.toJson());

    return docMem.id;
  }

  static Future updateMembers(Members members) async{
    final docMem=FirebaseFirestore.instance.collection("Members").doc(members.memId);
    await docMem.update(members.toJson());
  }
  static Future deleteMembers(Members members) async{
    final docMem=FirebaseFirestore.instance.collection("Members").doc(members.memId);
    await docMem.delete();
  }
}