import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_details_screen.dart';
import 'score_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool esFavorito = false;

  void alternarFavorito() {
    setState(() {
      esFavorito = !esFavorito;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Colors Dance',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                '🏆${context.watch<ScoreProvider>().puntos}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(
                      Icons.palette,
                      size: 64,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Nivel 1: Ritmo Base',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Presiona los botones para sumar puntos',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              ElevatedButton.icon(
                onPressed: alternarFavorito,
                icon: Icon(
                  esFavorito ? Icons.favorite : Icons.favorite_border,
                  color: esFavorito ? Colors.red : null,
                ),
                label: Text(esFavorito ? 'En favorito' : 'Agregar favoritos'),
              ),

              const SizedBox(height: 12),

              ElevatedButton.icon(
                onPressed: () {
                  context.read<ScoreProvider>().sumar();
                },
                icon: const Icon(Icons.add),
                label: const Text('Presionar Botón Rojo (+1)'),
              ),

              const SizedBox(height: 12),

              ElevatedButton.icon(
                onPressed: () {
                  context.read<ScoreProvider>().reiniciar();
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reiniciar Puntos'),
              ),

              const SizedBox(height: 32),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ColorDetailsScreen(
                              nombreColor: 'Modo Neón',
                            ),
                          ),
                        );
                      },
                      child: const _StatCard(
                        icon: Icons.color_lens,
                        label: 'Ver Detalles',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: _StatCard(
                      icon: Icons.speed,
                      label: 'Nivel 1/3',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatCard({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}