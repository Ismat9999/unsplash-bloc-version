import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/collection/collection_bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/home/home_cubit.dart';
import 'package:unsplashblocversion/presantation/blocs/photos/photo_bloc.dart';
import 'package:unsplashblocversion/presantation/blocs/search/search_bloc.dart';
import 'package:unsplashblocversion/presantation/pages/collection_page.dart';
import 'package:unsplashblocversion/presantation/pages/home_page.dart';
import 'package:unsplashblocversion/presantation/pages/photos_page.dart';
import 'package:unsplashblocversion/presantation/pages/search_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context)=> HomeCubit(),
        child: HomePage(),
      ),
      );
  }
}
