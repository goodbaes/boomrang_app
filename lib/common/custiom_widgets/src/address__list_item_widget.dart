import 'package:flutter/material.dart';

class AddressListItemWidget extends StatelessWidget {
  const AddressListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [Radio(value: 0, groupValue: 1, onChanged: (v) {})],
          ),
          Divider()
        ],
      ),
    );
  }
}
