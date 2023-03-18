class HomePageModel {
  final int id;
  final String name;
  final String url;
  final String image;

  HomePageModel( {
    required this.id,
    required this.name,
    required this.url,
    required this.image,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    return HomePageModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      image: json['image'],
    );
  }
}
