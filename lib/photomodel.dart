class Photo {
  final int id;
  final String title;

  Photo({required this.id, required this.title});

  factory Photo.fromjson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      title: json['title'],
    );
  }
}
