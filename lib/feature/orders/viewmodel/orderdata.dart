class OrderModel {
  final int id;
  final String orderId;
  final String name;
  final String product;
  final int price;
  final String image;
  final String? orderdate;
  final String? paymenttype;
  final String? address;
  String? status;
  OrderModel({
    required this.id,
    required this.orderId,
    required this.name,
    required this.product,
    required this.price,
    required this.image,
    this.orderdate,
    this.paymenttype,
    this.address,
    this.status,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"],
      orderId: json["orderId"],
      name: json["name"],
      product: json["product"],
      price: json["price"],
      image: json["image"],
      orderdate: json["orderdate"],
      paymenttype: json["paymenttype"],
      address: json["address"],
      status: json["status"],
    );
  }
}
