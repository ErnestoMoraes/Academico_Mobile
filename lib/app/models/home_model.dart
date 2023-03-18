class HomePage {
  final int id;
  final String name;
  final List<Page> pages;

  HomePage({
    required this.id,
    required this.name,
    required this.pages,
  });

  factory HomePage.fromJson(Map<String, dynamic> json) {
    final List<Page> pages = List.castFrom(json['pages'])
        .map((pageJson) => Page.fromJson(pageJson))
        .toList();

    return HomePage(
      id: json['id'],
      name: json['name'],
      pages: pages,
    );
  }
}

class Page {
  final int id;
  final String name;
  final String url;

  Page({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }
}
