import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box homeBox;
  @override
  void initState() {
    super.initState();
    homeBox = Hive.box('home');
    homeBox.put('1', 'soham');
    homeBox.put('2', 'Desai');
    homeBox.put('3', 'abc');
    homeBox.putAll({'4': 'xyz', '5': 'qwe'});
    homeBox.add('wasd');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(homeBox.get('1')),
          Text(homeBox.get('2')),
          Text(homeBox.get('1')),
        ],
      ),
    );
  }
}
