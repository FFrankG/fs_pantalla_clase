import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final ColorScheme color=Theme.of(context).colorScheme;

        return Scaffold(
      appBar: AppBar(
        backgroundColor: color.primary,
        title: const Text("Menu Screen"),   
      ),
      body: const Placeholder(),
    );
  }
}