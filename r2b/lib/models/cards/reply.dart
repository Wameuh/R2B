import 'package:flutter/material.dart';
import 'dart:math';

class Response extends StatelessWidget {
  const Response({
    super.key,
    required TextEditingController reponseController,
  }) : _reponseController = reponseController;

  final TextEditingController _reponseController;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 200,
        maxWidth: max(200, min(600, MediaQuery.of(context).size.width * 0.8)),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Text('Votre réponse :'),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Entrez votre réponse',
                  ),
                  controller: _reponseController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
