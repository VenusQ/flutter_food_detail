import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOME_PAGE')),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Center(child: Text("THIS IS A HOMEPAGE",style: Theme.of(context).textTheme.headline1,)),
            ),
          ],
        ),
      ),
    );
  }
}