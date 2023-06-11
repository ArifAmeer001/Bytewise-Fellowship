import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_app/common/utils/utils.dart';
import 'package:whatsapp_app/models/user_model.dart';

final selectContactRepositryProvider = Provider(
    (ref) => SelectContactRepositry(
        firestore: FirebaseFirestore.instance,
    ),
);

class SelectContactRepositry{
  final FirebaseFirestore firestore;

  SelectContactRepositry({required this.firestore});

  Future<List<Contact>> getContacts() async {
    List<Contact> contacts = [];
    try{
      if(await FlutterContacts.requestPermission()){
        contacts = await FlutterContacts.getContacts(withProperties: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return contacts;
  }

  void selectContact(Contact selectedContact, BuildContext context) async{
    try{
      var userCollection = await firestore.collection('users').get();
      bool isFound = false;
      for(var document in userCollection.docs){
        var userData = UserModel.fromMap(document.data());
        String selectedPhoneNumber = selectedContact.phones[0].number.replaceAll(' ', '');
        if(selectedPhoneNumber == userData.phoneNumber){
          isFound = true;
        }

        if(!isFound){
          showSnackBar(context: context, content: 'This number does not exist');
        }
      }
    } catch (e) {
      showSnackBar(context: context, content: e.toString());
    }

  }
}
