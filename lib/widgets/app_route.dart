
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/cubit/rickandmorty_cubit.dart';
import 'package:rick_and_morty/data/models/api/repo.dart';
import 'package:rick_and_morty/data/models/api/webservices.dart';
import 'package:rick_and_morty/data/models/results.dart';
import 'package:rick_and_morty/screens/all_charcters.dart';
import 'package:rick_and_morty/screens/charecter.dart';

class AppRoute{


 static Route<dynamic>? generateRoute(RouteSettings settings){
    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> BlocProvider<RickandmortyCubit>(
          create: (context) => RickandmortyCubit(Repo(WebServices())),
          child: AllCharacters(),
        ) );

      case 'second':
        final c = settings.arguments as Results;
        return MaterialPageRoute(builder: (_)=> CharactersScreen(character: c,));
    }
    return null;
  }
}