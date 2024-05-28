import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:u1r/features/shop/address/address_model.dart';
import 'package:u1r/features/shop/models/cart_model/cart_model.dart';
import 'package:u1r/helpers/helper_functions.dart';
import 'package:u1r/utils/constatnts/enums.dart';

class OrderModel {
  final String id;
  final String UserId;
  final OrderStatus status;
  final double totalamount;
  final DateTime orderDate;
  final String paymentmethod;
  final Addressmodel? adress;
  final DateTime? deliverydate;
  final List<CartModel> items;

  OrderModel(
      {required this.UserId,
      required this.id,
      this.adress,
      required this.status,
      this.deliverydate,
      required this.items,
      required this.orderDate,
      required this.totalamount,
      required this.paymentmethod});

  String get fromatedOrderdate => THelperFunctions.getFormattedDate(orderDate);
  String get fromatedOrderDeliverydate => deliverydate != null
      ? THelperFunctions.getFormattedDate(deliverydate!)
      : '';

  String get OrderStatustext => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipped '
          : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': UserId,
      'status': status.toString(),
      'totalamount': totalamount,
      'orderDate': orderDate,
      'paymentmethod': paymentmethod,
      'adress': adress?.toJson(),
      'deliverydate': deliverydate,
      'items': items.map((item) => item.toMap()).toList(),
    };
  }

  factory OrderModel.fromsnashopt(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return OrderModel(
        UserId: data['userId'] as String,
        id: data['id'] as String,
        status: OrderStatus.values
            .firstWhere((element) => element.toString() == data['status']),
        items: (data['items'] as List<dynamic>)
            .map((item) => CartModel.fromMap(item as Map<String, dynamic>))
            .toList(),
        orderDate: (data['orderDate'] as Timestamp).toDate(),
        totalamount: data['totalamount'] as double,
        paymentmethod: data['paymentmethod'],
        adress: Addressmodel.fromMap(data['adress'] as Map<String, dynamic>),
        deliverydate: data['deliverydate'] == null
            ? null
            : (data['deliverydate'] as Timestamp).toDate());
  }
}
