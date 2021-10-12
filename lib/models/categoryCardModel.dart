class CategoryCardModel {
  final String title;
  final String imageUrl;

  CategoryCardModel({
    required this.title,
    required this.imageUrl,
  });

  factory CategoryCardModel.fromJson(Map json) {
    return CategoryCardModel(
      title: json['title'],
      imageUrl: json['imageUrl'],
    );
  }
}
