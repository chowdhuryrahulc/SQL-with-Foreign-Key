// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlwithforiegnkey/Widgits/contacts_list.dart';
import 'package:sqlwithforiegnkey/Widgits/horizontal_button_bar.dart';
import 'package:sqlwithforiegnkey/database/contact_operations.dart';
import 'package:sqlwithforiegnkey/modals/contact.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key? key})
      : super(
          key: key,
        );

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  ContactOperations contactOperations = ContactOperations();
  List<Contact>? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLite Tutorial'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              HorizontalButtonBar(), //Widgets => HorizontalButtonBar
              FutureBuilder(
                future: contactOperations
                    .getAllContacts(), //Database=> contactOperations
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    data = snapshot.data;
                    return ContactsList(data!);
                  } else {
                    return Center(
                      child: Text('You have no contacts'),
                    );
                  }

                  // if (snapshot.hasError) print('error');
                  // data = snapshot.data;
                  // return snapshot.hasData
                  //     ? ContactsList(data!) //Widget=> ContactList
                  //     : new Center(
                  //         child: Text('You have no contacts'),
                  //       );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
