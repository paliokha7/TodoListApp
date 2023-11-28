import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/home_page.dart';
import 'package:todolist/provider/note_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Notes()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo List',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.deepPurple,
        ),
        home: const HomePage(),
      ),
    );
  }
}
