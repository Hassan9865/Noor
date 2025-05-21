import 'package:flutter/material.dart';
import 'package:noor/model/surah_model.dart';

class SurahItem extends StatelessWidget {
  final Surah surah;
  final VoidCallback onTap;

  const SurahItem({Key? key, required this.surah, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(surah.id.toString())),
      title: Text(surah.transliteration),
      subtitle: Text('${surah.translation} - ${surah.totalVerses} verses'),
      trailing: Text(surah.name, style: const TextStyle(fontSize: 20)),
      onTap: onTap,
    );
  }
}
