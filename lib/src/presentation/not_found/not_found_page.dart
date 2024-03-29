
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget{
  const NotFoundPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('404', style: TextStyle(fontSize: 40)),
            Text('Page not found', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
