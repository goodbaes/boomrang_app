import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_history_controller.dart';

class OrderHistoryView extends GetView<OrderHistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrderHistoryView'),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.separated(
              itemBuilder: (context, i) {
                OrderUiModerl order = controller.orderList[i];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.address,
                            style: Get.theme.textTheme.subtitle2,
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Text(order.getDateTimeString),
                              Text(' - '),
                              StatusWidget(status: order.status)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    thickness: 2,
                  ),
              itemCount: controller.orderList.length)),
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;
  Color getColor() {
    Color color = Colors.black;
    switch (status) {
      case 'Отменен':
        return Colors.red;
      case 'Новый':
        return Colors.blue;
      case 'Получен':
        return Colors.green;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Text(status,
        style: Get.theme.textTheme.subtitle2!.copyWith(color: getColor()));
  }
}
