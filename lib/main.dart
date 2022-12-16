import 'package:flutter/material.dart';
import 'package:todo/home.dart';
import 'package:provider/provider.dart';

import 'provider/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );*/

    return ChangeNotifierProvider(create: (context)=>FavoriteProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}


