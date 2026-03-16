class UserProductModel {
  final String title;
  final String image;
  final double money;
  final String description;
  final double offprice;
  final double discount;
  final int itemcount;

  UserProductModel({
    required this.title,
    required this.image,
    required this.money,
    required this.description,
    required this.offprice,
    required this.discount,
    required this.itemcount,
  });

  factory UserProductModel.fromJson(Map<String, dynamic> map) {
    return UserProductModel(
      title: map['title'] ?? "",
      image: map['image'] ?? "",
      money: (map['money'] as num?)?.toDouble() ?? 0.0,
      offprice: (map['offprice'] as num?)?.toDouble() ?? 0.0,
      discount: (map['discount'] as num?)?.toDouble() ?? 0.0,
      itemcount: map['itemcount'] ?? 0,
      description: map['description'] ?? "",
    );
  }
}
