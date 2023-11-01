import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/models/results.dart';

class CharactersScreen extends StatelessWidget {
  final Results character;

  const CharactersScreen({required this.character, super.key});

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
        body: CustomScrollView(slivers: [
      SliverAppBar(
        title: Text(
          character.name,
          style: const TextStyle(color: Colors.white),
        ),
        expandedHeight: 600,
        // pinned: true,
        //stretch: true,
        backgroundColor: Colors.grey,
        flexibleSpace: FlexibleSpaceBar(
          background: Hero(
            tag: character.id,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        Container(
          margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              characterInfo('Status : ', character.status),
              const SizedBox(
                height: 10,
              ),
              characterInfo('Species : ', character.species),
              const SizedBox(
                height: 10,
              ),
              characterInfo('Gender : ', character.gender),
              const SizedBox(
                height: 10,
              ),
              characterInfo('Origin : ', character.origin.name),
              const SizedBox(
                height: 10,
              ),
              characterInfo('Location : ', character.location.name),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        )
      ])),
    ]));
  }
}
