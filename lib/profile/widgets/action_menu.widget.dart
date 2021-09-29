import 'package:flutter/material.dart';
import 'package:fundl_app/auth/services/login.service.dart';

class ActionMenu extends StatelessWidget {
  const ActionMenu({Key? key}) : super(key: key);

  void _handleLogout(BuildContext context) {
    LoginService.logout();
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              child: ListTile(
                title: const Text('Logout'),
                onTap: () => _handleLogout(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
