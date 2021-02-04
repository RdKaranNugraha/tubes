import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id;
  final String name;
  final String image;
  final String harga;
  final int nik;
  final String nomorPolisi;

  Item({
    this.id,
    this.name,
    this.image,
    this.harga,
    this.nik,
    this.nomorPolisi,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      harga: json['harga'],
      nik: json['nik'],
      nomorPolisi: json['nomorPolisi'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'harga': harga,
        'nik': nik,
        'nomorPolisi': nomorPolisi,
      };

  factory Item.fromFireStore(DocumentSnapshot doc) {
    return Item(
      id: doc['id'],
      name: doc['name'],
      image: doc['image'],
      harga: doc['harga'],
      nik: doc['nik'],
      nomorPolisi: doc['nomorPolisi'],
    );
  }
}
