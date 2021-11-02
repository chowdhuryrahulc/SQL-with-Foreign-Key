// ignore_for_file: prefer_const_constructors, type_init_formals, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlwithforiegnkey/database/contact_operations.dart';
import 'package:sqlwithforiegnkey/modals/contact.dart';
import 'package:sqlwithforiegnkey/pages/edit_contactPage.dart';

class ContactsList extends StatelessWidget {
  List<Contact> contacts;
  ContactOperations contactOperations = ContactOperations();

  ContactsList(List<Contact> this.contacts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key('${contacts[index].id}'),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          ' ${contacts[index].id} ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' ${contacts[index].name}  ${contacts[index].surname}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditContactPage(
                                            contact: contacts[index],
                                          )));
                            },
                            // color: Colors.orange,
                            child: Icon(Icons.edit, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            onDismissed: (direction) {
              contactOperations.deleteContact(contacts[index]);
            },
          );
        },
      ),
    );
  }
}
