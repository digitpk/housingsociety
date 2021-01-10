import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:housingsociety/screens/home/modules/contacts/addemergencycontact.dart';
import 'package:housingsociety/shared/constants.dart';
import 'package:housingsociety/shared/loading.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Query contactsEmergency = FirebaseFirestore.instance
        .collection('module_contacts_emergency')
        .orderBy('name');
    return StreamBuilder<QuerySnapshot>(
      stream: contactsEmergency.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        }
        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: document.data()['profile_picture'] == ''
                    ? AssetImage('assets/images/default_profile_pic.jpg')
                    : NetworkImage(document.data()['profile_picture']),
              ),
              title: Text(
                document.data()['name'],
              ),
              subtitle: Text(
                document.data()['address'],
              ),
              trailing: IconButton(
                color: kAmaranth,
                icon: Icon(Icons.call),
                onPressed: () {
                  launch("tel://" + document.data()['phone_no']);
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEmergencyContact(
                      currentName: document.data()['name'],
                      currentPhone: document.data()['phone_no'],
                      currentAddress: document.data()['address'],
                      currentProfilePicture: document.data()['profile_picture'],
                      flag: 0,
                      docid: document.id,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}