// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sqlwithforiegnkey/pages/add_catagory_page.dart';
import 'package:sqlwithforiegnkey/pages/add_contactPage.dart';
import 'package:sqlwithforiegnkey/pages/contact_page.dart';
import 'package:sqlwithforiegnkey/pages/edit_contactPage.dart';
import 'package:sqlwithforiegnkey/pages/search_contactByCatagory.dart';
import 'package:sqlwithforiegnkey/pages/search_contacts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/homePage': (context) => ContactsPage(),
        '/addContactPage': (context) => AddContactPage(),
        '/edit': (context) => EditContactPage(),
        '/searchPage': (context) => SearchPage(),
        '/addCategoryPage': (context) => AddCategoryPage(),
        '/searchContactsByCategory': (context) => SearchContactsByCategory()
      },
      home: ContactsPage(),
    );
  }
}
