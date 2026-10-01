import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'score_provider.dart';

class ColorDetailsScreen extends StatelessWidget {
  final String nombreColor;
  const ColorDetailsScreen({super.key, required this.nombreColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nombreColor)),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.color_lens, size: 80, color: Colors.deepPurple),
              const SizedBox(height: 16),
              Text(
                nombreColor,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<ScoreProvider>().sumar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '$nombreColor sumó un punto correctamente',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Sumar punto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}