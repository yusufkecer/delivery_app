import 'package:flutter/material.dart';
import 'package:rotation_app/core/extension/context_extension.dart';
import 'package:rotation_app/features/home/home_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends HomeModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showGeneralError();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Text(
            'Home',
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
