class Podcast {
  List<Episodes>? episodes;

  Podcast({this.episodes});

  Podcast.fromJson(Map<String, dynamic> json) {
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(new Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.episodes != null) {
      data['episodes'] = this.episodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Episodes {
  String? audioPreviewUrl;
  String? description;
  int? durationMs;
  bool? explicit;
  ExternalUrls? externalUrls;
  String? href;
  String? htmlDescription;
  String? id;
  List<Images>? images;
  bool? isExternallyHosted;
  bool? isPlayable;
  String? language;
  List<String>? languages;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  ResumePoint? resumePoint;
  Show? show;
  String? type;
  String? uri;

  Episodes(
      {this.audioPreviewUrl,
      this.description,
      this.durationMs,
      this.explicit,
      this.externalUrls,
      this.href,
      this.htmlDescription,
      this.id,
      this.images,
      this.isExternallyHosted,
      this.isPlayable,
      this.language,
      this.languages,
      this.name,
      this.releaseDate,
      this.releaseDatePrecision,
      this.resumePoint,
      this.show,
      this.type,
      this.uri});

  Episodes.fromJson(Map<String, dynamic> json) {
    audioPreviewUrl = json['audio_preview_url'];
    description = json['description'];
    durationMs = json['duration_ms'];
    explicit = json['explicit'];
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    htmlDescription = json['html_description'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    isExternallyHosted = json['is_externally_hosted'];
    isPlayable = json['is_playable'];
    language = json['language'];
    languages = json['languages'].cast<String>();
    name = json['name'];
    releaseDate = json['release_date'];
    releaseDatePrecision = json['release_date_precision'];
    resumePoint = json['resume_point'] != null
        ? new ResumePoint.fromJson(json['resume_point'])
        : null;
    show = json['show'] != null ? new Show.fromJson(json['show']) : null;
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['audio_preview_url'] = this.audioPreviewUrl;
    data['description'] = this.description;
    data['duration_ms'] = this.durationMs;
    data['explicit'] = this.explicit;
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['html_description'] = this.htmlDescription;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['is_externally_hosted'] = this.isExternallyHosted;
    data['is_playable'] = this.isPlayable;
    data['language'] = this.language;
    data['languages'] = this.languages;
    data['name'] = this.name;
    data['release_date'] = this.releaseDate;
    data['release_date_precision'] = this.releaseDatePrecision;
    if (this.resumePoint != null) {
      data['resume_point'] = this.resumePoint!.toJson();
    }
    if (this.show != null) {
      data['show'] = this.show!.toJson();
    }
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  ExternalUrls.fromJson(Map<String, dynamic> json) {
    spotify = json['spotify'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spotify'] = this.spotify;
    return data;
  }
}

class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

  Images.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class ResumePoint {
  bool? fullyPlayed;
  int? resumePositionMs;

  ResumePoint({this.fullyPlayed, this.resumePositionMs});

  ResumePoint.fromJson(Map<String, dynamic> json) {
    fullyPlayed = json['fully_played'];
    resumePositionMs = json['resume_position_ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fully_played'] = this.fullyPlayed;
    data['resume_position_ms'] = this.resumePositionMs;
    return data;
  }
}

class Show {
  List<String>? availableMarkets;
  List<Null>? copyrights;
  String? description;
  bool? explicit;
  ExternalUrls? externalUrls;
  String? href;
  String? htmlDescription;
  String? id;
  List<Images>? images;
  bool? isExternallyHosted;
  List<String>? languages;
  String? mediaType;
  String? name;
  String? publisher;
  int? totalEpisodes;
  String? type;
  String? uri;

  Show(
      {this.availableMarkets,
      this.copyrights,
      this.description,
      this.explicit,
      this.externalUrls,
      this.href,
      this.htmlDescription,
      this.id,
      this.images,
      this.isExternallyHosted,
      this.languages,
      this.mediaType,
      this.name,
      this.publisher,
      this.totalEpisodes,
      this.type,
      this.uri});

  Show.fromJson(Map<String, dynamic> json) {
    availableMarkets = json['available_markets'].cast<String>();
    if (json['copyrights'] != null) {
      copyrights = <Null>[];
      json['copyrights'].forEach((v) {
        copyrights!.add(new Null.fromJson(v));
      });
    }
    description = json['description'];
    explicit = json['explicit'];
    externalUrls = json['external_urls'] != null
        ? new ExternalUrls.fromJson(json['external_urls'])
        : null;
    href = json['href'];
    htmlDescription = json['html_description'];
    id = json['id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    isExternallyHosted = json['is_externally_hosted'];
    languages = json['languages'].cast<String>();
    mediaType = json['media_type'];
    name = json['name'];
    publisher = json['publisher'];
    totalEpisodes = json['total_episodes'];
    type = json['type'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available_markets'] = this.availableMarkets;
    if (this.copyrights != null) {
      data['copyrights'] = this.copyrights!.map((v) => v.toJson()).toList();
    }
    data['description'] = this.description;
    data['explicit'] = this.explicit;
    if (this.externalUrls != null) {
      data['external_urls'] = this.externalUrls!.toJson();
    }
    data['href'] = this.href;
    data['html_description'] = this.htmlDescription;
    data['id'] = this.id;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['is_externally_hosted'] = this.isExternallyHosted;
    data['languages'] = this.languages;
    data['media_type'] = this.mediaType;
    data['name'] = this.name;
    data['publisher'] = this.publisher;
    data['total_episodes'] = this.totalEpisodes;
    data['type'] = this.type;
    data['uri'] = this.uri;
    return data;
  }
}
