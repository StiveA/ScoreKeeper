import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_theme.dart';
import '../../../core/services/get_it_service.dart';
import '../../../core/services/sound_service.dart';
import '../stores/game_store.dart';

class NewMatchView extends StatefulWidget {
  const NewMatchView({super.key});

  @override
  State<NewMatchView> createState() => _NewMatchViewState();
}

class _NewMatchViewState extends State<NewMatchView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _teamUs = TextEditingController();
  final TextEditingController _teamThem = TextEditingController();
  int _maxPoints = 12;

  final GameStore _store = getIt<GameStore>();
  final SoundService _sound = getIt<SoundService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Nova Partida"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField("Nome do Time (Nós)", _teamUs),
              const SizedBox(height: 12),
              _buildTextField("Nome do Time (Eles)", _teamThem),
              const SizedBox(height: 24),
              _buildMaxPointSelector(),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _sound.playClick();
                    _store.startMatch(
                      _teamUs.text.trim(),
                      _teamThem.text.trim(),
                      _maxPoints,
                    );
                    context.go('/');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Iniciar Partida",
                    style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white38),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "Campo obrigatório";
        }
        return null;
      },
    );
  }

  Widget _buildMaxPointSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Pontuação máxima", style: TextStyle(color: Colors.white70)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          children: [12, 15, 18].map((pt) {
            return ChoiceChip(
              label: Text("$pt pontos"),
              labelStyle: TextStyle(
                color: _maxPoints == pt ? Colors.white : Colors.white70,
              ),
              selected: _maxPoints == pt,
              onSelected: (_) => setState(() => _maxPoints = pt),
              selectedColor: AppTheme.primary,
              backgroundColor: Colors.grey[800],
            );
          }).toList(),
        ),
      ],
    );
  }
}
