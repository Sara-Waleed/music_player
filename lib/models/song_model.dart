class GeniusSongDetails {
  Meta? meta;
  Response? response;

  GeniusSongDetails({this.meta, this.response});

  GeniusSongDetails.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Meta {
  int? status;

  Meta({this.status});

  Meta.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    return data;
  }
}

class Response {
  Song? song;

  Response({this.song});

  Response.fromJson(Map<String, dynamic> json) {
    song = json['song'] != null ? Song.fromJson(json['song']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (song != null) {
      data['song'] = song!.toJson();
    }
    return data;
  }
}

class Song {
  int? id;
  String? title;
  String? titleWithFeatured;
  PrimaryArtist? primaryArtist;

  Song({this.id, this.title, this.titleWithFeatured, this.primaryArtist});

  Song.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    titleWithFeatured = json['title_with_featured'];
    primaryArtist = json['primary_artist'] != null ? PrimaryArtist.fromJson(json['primary_artist']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['title_with_featured'] = titleWithFeatured;
    if (primaryArtist != null) {
      data['primary_artist'] = primaryArtist!.toJson();
    }
    return data;
  }
}

class PrimaryArtist {
  int? id;
  String? name;

  PrimaryArtist({this.id, this.name});

  PrimaryArtist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}