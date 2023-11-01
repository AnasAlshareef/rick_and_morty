import 'package:rick_and_morty/data/models/api/webservices.dart';


import '../results.dart';

class Repo{

  final WebServices charactersWebServices;


  Repo(this.charactersWebServices);

  Future<List<Results>> getAllCharacters() async {
  return  charactersWebServices.fetchAllCharacters();
  }

  }
