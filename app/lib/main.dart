import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suraksha/maps/bloc.dart';
import 'Screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen()
      ),
    );
  }
}

