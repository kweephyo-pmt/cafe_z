import 'package:cafe_z/components/text_box.dart';
import 'package:cafe_z/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // User
  final currentUser = FirebaseAuth.instance.currentUser;
  //all users
  final userCollection = FirebaseFirestore.instance.collection("Users");

  //edit field
  Future<void>editField(String field) async{
    String newValue = "";
    await showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text("Edit $field", 
        style: const TextStyle(color: Colors.white),
        ), 
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: TextStyle(color: Colors.grey),
        ),
        onChanged: (value){
          newValue = value;
        },
        ),
        actions: [
          //cancel button
          TextButton(
            child: Text('Cancel', style: TextStyle(color: Colors.white),),
            onPressed: () => Navigator.pop(context),
          ),
          //save button
          TextButton(
            child: Text('Save', style: TextStyle(color: Colors.white),),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
      );
      //update firestore
      if(newValue.trim().length>0){
        //only update if there is something in the text field
        await userCollection.doc(currentUser?.email).update({field: newValue});
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
          .collection("Users")
          .doc(currentUser?.email)
          .snapshots(),
        builder: (context, snapshot){
          //get userdata
          if(snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
        children: [
          const SizedBox(height: 50),
          // Profile pic
          const Icon(
            Icons.person,
            size: 72,
          ),
          // User email
         const SizedBox(height: 10),

          Text(
            currentUser?.email ?? 'No email',
            textAlign: TextAlign.center,
            style: TextStyle(color: const Color.fromRGBO(97, 97, 97, 1)),
            ),
           const SizedBox(height: 50),
 // Use null-aware operator and provide a fallback if email is null
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text('My Details',
            style: TextStyle(color: const Color.fromRGBO(97, 97, 97, 1)),
          )
          ),

          // User name
          MyTextBox(
            text: userData['username'], 
            sectionName: 'username',
            onPressed: ()=> editField('username'),
            ),

            //bio
           MyTextBox(
            text: userData['bio'], 
            sectionName: 'bio',
            onPressed: ()=> editField('bio'),
            ),
        ],
      );
          } else if(snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        }
        ),
    );
  }
}
