import 'package:rick_and_morty/data/models/info.dart';
import 'package:rick_and_morty/data/models/results.dart';

class RickAndMorty {
  RickAndMorty({
    required this.info,
    required this.results,
  });
  late final Info info;
  late final List<Results> results;

  RickAndMorty.fromJson(Map<String, dynamic> json){
    info = Info.fromJson(json['info']);
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['info'] = info.toJson();
    data['results'] = results.map((e)=>e.toJson()).toList();
    return data;
  }
}
