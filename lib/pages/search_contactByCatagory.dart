// ignore_for_file: file_names, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlwithforiegnkey/Widgits/catagories_Dropdown.dart';
import 'package:sqlwithforiegnkey/Widgits/contacts_list.dart';
import 'package:sqlwithforiegnkey/database/catagory_operations.dart';
import 'package:sqlwithforiegnkey/database/contact_operations.dart';
import 'package:sqlwithforiegnkey/modals/catagory.dart';
import 'package:sqlwithforiegnkey/modals/contact.dart';

class SearchContactsByCategory extends StatefulWidget {
  SearchContactsByCategory({Key? key}) : super(key: key);

  @override
  _SearchContactsByCategoryState createState() =>
      _SearchContactsByCategoryState();
}

class _SearchContactsByCategoryState extends State<SearchContactsByCategory> {
  ContactOperations contactOperations = ContactOperations();
  CategoryOperations categoryOperations = CategoryOperations();
  Category? _selectedCategory;
  List<Contact>? data;

  callback(selectedCategory) {
    setState(() {
      _selectedCategory = selectedCategory;
      print(_selectedCategory!.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLite Tutorial'),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/homePage');
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<Category>>(
              future: categoryOperations.getAllCategories(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? CategoriesDropDown(snapshot.data!, callback)
                    : Text('No categories');
              },
            ),
            FutureBuilder(
              future:
                  contactOperations.getAllContactsByCategory(_selectedCategory),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) print('error');
                data = snapshot.data;
                return snapshot.hasData
                    ? ContactsList(data!)
                    : Center(
                        child: Text('You have no contacts'),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
