class Unsplash{
  final String id;
  final int width;
  final int height;
  final Urls urls;

  const Unsplash({
    required this.id,
    required this.width,
    required this.height,
    required this.urls
  });

  factory Unsplash.fromJson(Map<String, dynamic> json){
    return Unsplash(
        id: json['id'],
        width: json["width"],
        height: json["height"],
        urls: Urls.fromJson(json["urls"]));
  }

}

class Urls {
  const Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smallS3;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
    smallS3: json["small_s3"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
    "small_s3": smallS3,
  };
}