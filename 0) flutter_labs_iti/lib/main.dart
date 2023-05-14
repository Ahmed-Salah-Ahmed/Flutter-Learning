import 'package:flutter/material.dart';

import 'cvcard.dart';
import 'network.dart';
import 'saxophone.dart';
import 'todolist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/saxophone': (context) => Saxophone(),
        '/todo_list': (context) => TodoListScreen(),
        '/network': (context) => Network(),
        '/cv_card': (context) => CvCard(),
      },
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(
                    customText: 'Saxophone Music',
                    routeName: '/saxophone',
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    customText: 'To-do List',
                    routeName: '/todo_list',
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    customText: 'Image from Network',
                    routeName: '/network',
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    customText: 'Profile Card',
                    routeName: '/cv_card',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.customText,
    required this.routeName,
  }) : super(key: key);

  final String customText;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, routeName);
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        backgroundColor: const Color.fromARGB(255, 35, 0, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        customText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
