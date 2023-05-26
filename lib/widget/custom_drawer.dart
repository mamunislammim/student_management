import 'package:flutter/material.dart';
import 'package:student_management/view/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer(
      {Key? key,
      required this.name,
      required this.phn,
      required this.img,
      required this.email})
      : super(key: key);
  String? name;
  String? email;
  String? phn;
  String? img;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey.shade100,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(img.toString()),
            ),
            accountEmail: Text(email.toString()),
            accountName: Text(
              name.toString(),
              style: const TextStyle(fontSize: 24.0),
            ),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.apartment),
            title: const Text(
              'Apartments',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.house_outlined),
            title: const Text(
              'Townhomes',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(
            height: 10,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text(
              'Favorites',
              style: TextStyle(fontSize: 24.0),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
