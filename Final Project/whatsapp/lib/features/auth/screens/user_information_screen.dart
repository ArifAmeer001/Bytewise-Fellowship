import 'dart:io';
import 'package:flutter/material.dart';
import 'package:whatsapp_app/common/utils/utils.dart';

class UserInformationScreen extends StatefulWidget {
  static const String routeName = '/user-information';

  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreen();
}

  File? image;

  class _UserInformationScreen extends State<UserInformationScreen>{

  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async{
    image = await pickImageFromGallarey(context);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  image == null ?
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/2726111/pexels-photo-2726111.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    radius: 64,
                  )
                  : CircleAvatar(
                    backgroundImage: FileImage(image!),
                    radius: 64,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width*0.85,
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your name'
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: (){}, 
                      icon: Icon(Icons.done)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
