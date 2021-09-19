part of './login_view.dart';

class _LoginPhone extends StatelessWidget {
  
  final LoginController loginController = Get.find();
  
  void onLogin(){

  }

  _border() => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white));
  _focusedBorder() => OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.lightGreen));
  _enabledBorder() => OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white));
  _contentPadding() =>
      EdgeInsets.only(bottom: 12, top: 12, left: 16, right: 16);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 16),
          Text('Введите номер телефона, чтобы войти или зарегистрироваться'),
          SizedBox(height: 16),
          Container(
            child: _buildPhoneField(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneField() {
    final mask = MaskTextInputFormatter(
      mask: '+996#########',
      filter: {"#": RegExp(r'[0-9]')},
    );
    
    final length = loginController.phoneTextEditController.text.length;

    loginController.phoneTextEditController.selection = TextSelection(
      baseOffset: length,
      extentOffset: length,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: TextFormField(
            controller: loginController.phoneTextEditController,
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [mask],
            maxLength: 18,
            onChanged: (value) {
              // final phone = mask.getUnmaskedText();
              // print(phone);
              // controller.phone.value = '+996' + phone;
            },
            decoration: InputDecoration(
              counterText: '',
              labelStyle: Get.textTheme.subtitle1!.copyWith(
                color: Colors.white
              ),
              // hintStyle: _hintStyle(),
              border: _border(),
              focusedBorder: _focusedBorder(),
              enabledBorder: _enabledBorder(),
              contentPadding: _contentPadding(),
              hintText: '+996 000 000 000',
              // labelText: LocaleKeys.login_enter_phone_number.tr,
            ),
          ),
        ),
        SizedBox(height: 32),
        DefaultButton.withProgress(
          isProgress: loginController.isLoading,
          text: LocaleKeys.login_send_sms_code.tr,
          onTap: loginController.sendPhone,
        ),
      ],
    );
  }
}