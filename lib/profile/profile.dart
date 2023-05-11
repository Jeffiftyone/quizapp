import 'package:flutter/material.dart';
import 'package:quiz_app/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        //sign out button
        body: ElevatedButton(
            child: Text('Sign Out'),
            onPressed: () async {
              await AuthService().signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            }));
  }
}
