import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/cubit/rickandmorty_cubit.dart';

import '../widgets/character.dart';


class AllCharacters extends StatefulWidget {
  const AllCharacters({super.key});

  @override
  State<AllCharacters> createState() => _AllCharactersState();
}

class _AllCharactersState extends State<AllCharacters> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    BlocProvider.of<RickandmortyCubit>(context).fetchAllCharacters();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: const Text('Characters',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: BlocBuilder<RickandmortyCubit,RickandmortyState>(builder: (context,state){
        if(state is RickandmortyLoaded){
          final c = state.results;
          return SingleChildScrollView(
            child: Container(
              color: Colors.grey,
              child: Column(
                children: [
              GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: c.length,
              itemBuilder: (ctx, index) {
                return CharacterItem(
                  character: c[index]
                );
              },
            ),
                ],
              ),
            ),
          );

        }
        if (state is RickandmortyLoading){
          return const Center(child: CircularProgressIndicator(color: Colors.yellow,));
        }

        return Container();
      },)
    );
  }
}
