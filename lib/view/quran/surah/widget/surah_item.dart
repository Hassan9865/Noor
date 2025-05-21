import 'package:flutter/material.dart';
import 'package:noor/model/surah_model.dart';

class SurahItem extends StatelessWidget {
  final Surah surah;
  final VoidCallback onTap;

  const SurahItem({Key? key, required this.surah, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Txtsize = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          tileColor: Colors.teal[50]!,
          leading: CircleAvatar(child: Text(surah.id.toString())),
          title: Text(
            surah.transliteration,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
          ),
          subtitle: Text(
            '${surah.translation} - ${surah.totalVerses} verses',
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Text(
            surah.name,
            style: TextStyle(
              fontSize: Txtsize * 0.06,
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
