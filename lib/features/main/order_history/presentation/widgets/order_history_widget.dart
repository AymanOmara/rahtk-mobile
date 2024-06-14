import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:domain/features/order/entity/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderHistoryWidget extends StatelessWidget {
  const OrderHistoryWidget({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    TextStyle orderIDStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    TextStyle orderDateStyle = const TextStyle(
      fontSize: 14,
      color: Colors.grey,
    );
    TextStyle totalPriceStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    TextStyle labelStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    TextStyle valueStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black,
    );

    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${"order_id".tr} ${order.id}",
                style: orderIDStyle,
              ),
              Text(
                "${"order_date".tr} ${DateFormat("yyyy-MM-dd").format(DateTime.parse(order.date))}",
                style: orderDateStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CachedNetworkImage(
                imageUrl:
                    "${Common.baseUrl}""${order.items.first.product?.image}",
                width: 102,
                height: 102,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                ),
              ),
              Text(
                "${"total_price".tr} ${order.totalPrice()}",
                style: totalPriceStyle,
              ),
            ],
          ),
          const SizedBox(height: 10), // Add space between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("delivery_address".tr, style: labelStyle),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  order.address.toString(),
                  style: valueStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Add space between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text("payment_method".tr, style: labelStyle),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  order.paymentMethod.toString().tr,
                  style: valueStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
