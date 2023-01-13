import 'package:flutter/material.dart';
import 'package:gallery/app/data/mock.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Photo> data;

  @override
  void initState() {
    super.initState();
    data = Photo.data;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
