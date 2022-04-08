import 'package:flutter/material.dart';

class AuthenticationLayout extends StatelessWidget {
  
  final Widget child;

  const AuthenticationLayout({
    Key? key ,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
