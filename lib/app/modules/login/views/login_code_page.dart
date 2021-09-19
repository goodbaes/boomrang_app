part of './login_view.dart';

class _LoginCode extends StatelessWidget{
  
  final LoginController loginController = Get.find();

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
          Text('Вам отправлен код в СМС. Введите его, чтобы войти'),
          SizedBox(height: 16),
          Container(
            child: _buildCodeField(),
          )
        ],
      ),
    );
  }

  Widget _buildCodeField() {
    final mask = MaskTextInputFormatter(
      mask: '######',
      filter: {"#": RegExp(r'[0-9]')},
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: TextField(
            autofocus: true,
            keyboardType: TextInputType.number,
            inputFormatters: [
              mask,
              FilteringTextInputFormatter.digitsOnly,
            ],
            maxLength: 18,
            onChanged: (value) async {
              loginController.code.value = value;
            },
            decoration: InputDecoration(
              counterText: '',
              focusColor: Get.theme.primaryColor,
              hintText: '- - - - - -',
              labelText: LocaleKeys.login_enter_sms_code.tr,
              labelStyle: Get.textTheme.subtitle1,
              // hintStyle: _hintStyle(),
              border: _border(),
              focusedBorder: _focusedBorder(),
              enabledBorder: _enabledBorder(),
              contentPadding: _contentPadding(),
            ),
          ),
        ),
        Column(
          children: [
            TextButton(
              onPressed: () {
                loginController.enterPhoneAgain();
              },
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Get.theme.hintColor)),
              child: Center(
                child: Text(LocaleKeys.login_skip.tr),
              ),
            ),
            DefaultButton.withProgress(
              isProgress: loginController.isLoading,
              text: LocaleKeys.login_enter_sms_code.tr,
              onTap: loginController.enterCode,
            ),
          ],
        ),
      ],
    );
  }
}