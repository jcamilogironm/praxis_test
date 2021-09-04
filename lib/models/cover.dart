class Cover{

  final String? url;

  Cover({this.url});

  factory Cover.fromJson(Map<String, dynamic> json) {
    return Cover(
     url: json['download_url']
    );
  }
}