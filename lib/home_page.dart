import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      email: 'johndoe@example.com',
      phoneNumber: '+1 123-456-7890',
    ),
    Contact(
      name: 'Jane Smith',
      email: 'janesmith@example.com',
      phoneNumber: '+1 987-654-3210',
    ),
    Contact(
      name: 'Bob Williams',
      email: 'bobwilliams@example.com',
      phoneNumber: '+1 999-888-7777',
    ),
    Contact(
      name: 'Alice Johnson',
      email: 'alicejohnson@example.com',
      phoneNumber: '+1 555-555-5555',
    ),
  ];
  ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: const Text('Contact List')),
        body: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(contacts[index].name),
              onTap: () {
                _showContactDetails(context, contacts[index]);
              },
            );
          },
        ),
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Name'),
                  subtitle: Text(contact.name),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(contact.email),
                ),
                ListTile(
                  title: const Text('Phone Number'),
                  subtitle: Text(contact.phoneNumber),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}
