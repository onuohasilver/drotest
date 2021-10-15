import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DrugModel extends Equatable {
  String type, name, imageUrl;
  int price;
  DrugModel(
      {required this.price,
      required this.name,
      required this.type,
      required this.imageUrl});

  factory DrugModel.fromJson(Map json) {
    return DrugModel(
        price: json['Price'],
        name: json['Name'],
        type: json['Type'],
        imageUrl: json['ImageUrl']);
  }
  @override
  List<Object?> get props => [name, price, type];
  get toMap =>
      {'Price': price, 'Name': name, 'Type': type, 'ImageUrl': imageUrl};

  @override
  String toString() {
    return toMap.toString();
  }
}
