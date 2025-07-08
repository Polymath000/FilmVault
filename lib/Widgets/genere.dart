import 'package:flutter/material.dart';
import 'package:movies_app/DataBase/generes_types.dart';
import 'package:movies_app/generated/l10n.dart';

class Genere extends StatelessWidget {
  const Genere({super.key, required this.index, this.isActive = false});
  final int index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isActive ? Colors.blue : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Text(
        getName(context),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  String getName(BuildContext context) {
    String name = genres[index]["name"];                    
    if(name == "Popular") {
      name = S.of(context).popular;
    } else if(name == "Top Rated") {
     name = S.of(context).topRated;
    } else if(name == "Now Playing") {
    name = S.of(context).nowPlaying;
    }
    return name;
  }
}
