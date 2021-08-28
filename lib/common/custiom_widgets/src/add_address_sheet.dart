import 'package:boomerang/data/src/dto/src/address_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'default_button.dart';

class AddAddressWidget extends StatelessWidget {
  final List<AddressListItemModel> addressList;
  const AddAddressWidget(
    this.addressList, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Text('Мои адреса:', style: Get.theme.textTheme.headline3),
            SizedBox(
              height: 50,
            ),
            addressList.isNotEmpty
                ? ListView(
                    children: [Divider()] +
                        addressList.map((e) => Divider()).toList(),
                  )
                : Text('Здесь будут ваши адреса')
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: DefaultButton(
            text: '+ Новый адрес',
            onTap: () {},
          ),
        )
      ],
    );
  }
}
