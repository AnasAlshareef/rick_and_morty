class Results {
  Results({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
  late final int id;
  late final String name;
  late final String status;
  late final String species;
  late final String type;
  late final String gender;
  late final Origin origin;
  late final Location location;
  late final String image;
  late final List<String> episode;
  late final String url;
  late final String created;

  Results.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = Origin.fromJson(json['origin']);
    location = Location.fromJson(json['location']);
    image = json['image'];
    episode = List.castFrom<dynamic, String>(json['episode']);
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    data['origin'] = origin.toJson();
    data['location'] = location.toJson();
    data['image'] = image;
    data['episode'] = episode;
    data['url'] = url;
    data['created'] = created;
    return data;
  }
}

class Origin {
  Origin({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Origin.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Location {
  Location({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Location.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
