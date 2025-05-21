import 'package:flutter/material.dart';
import 'package:noor/model/ayat_model.dart';

class AyahItem extends StatelessWidget {
  final Ayah ayah;

  const AyahItem({Key? key, required this.ayah}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ayah.text,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            'Surah ${ayah.chapter}, Ayah ${ayah.verse}',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
