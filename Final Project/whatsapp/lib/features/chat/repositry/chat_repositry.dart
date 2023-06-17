import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_app/common/utils/utils.dart';
import 'package:whatsapp_app/models/user_model.dart';

class ChatRepositry{
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;

  ChatRepositry({required this.firebaseFirestore, required this.firebaseAuth});

  void sendTestMessage({
    required BuildContext context,
    required String text,
    required String recieverUserId,
    required UserModel senderUser,
  }) async{
    try{
      var timeSent = DateTime.now();
      UserModel recieverUserData;

      var userDataMap = await firebaseFirestore.collection('users').doc(recieverUserId).get();

      recieverUserData = UserModel.fromMap(userDataMap.data()!);
    } catch (e){
      showSnackBar(context: context, content: e.toString());
    }
  }
}