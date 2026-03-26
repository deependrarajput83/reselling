class UserProductModel {
  final String title;
  final List<String> image;
  final double money;
  final String category;
  final String description;
  final double offprice;
  final double discount;
  final int itemcount;
  final double weight;
  final bool isLock;
  final List<String> tags;
  UserProductModel({
    required this.title,
    required this.image,
    required this.money,
    required this.description,
    required this.offprice,
    required this.discount,
    required this.itemcount,
    required this.weight,
    required this.category,
    required this.tags,
    required this.isLock,
  });

  factory UserProductModel.fromJson(Map<String, dynamic> map) {
    return UserProductModel(
      title: map['title'] ?? "",

      image: map['image'] is List
          ? List<String>.from(map['image'])
          : map['image'] != null
          ? [map['image'].toString()]
          : [],

      money: (map['money'] as num?)?.toDouble() ?? 0.0,

      offprice: (map['offprice'] as num?)?.toDouble() ?? 0.0,

      discount: (map['discount'] as num?)?.toDouble() ?? 0.0,

      itemcount: map['itemcount'] ?? 0,

      description: map['description'] ?? "",

      weight: (map['Weight'] as num?)?.toDouble() ?? 0.0,

      category: map['Category'] ?? "",

      tags: map['Tags'] is List
          ? List<String>.from(map['Tags'])
          : map['Tags'] != null
          ? [map['Tags'].toString()]
          : [],
      isLock: map["isLock"] ?? false,
    );
  }
}
