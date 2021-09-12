part of 'app_theme.dart';

ElevatedButtonThemeData get _elevatedButtonThemeData => ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 16),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.blackText,
          ),
        ),
        backgroundColor: _elevatedButtonBackgroundColor(),
      ),
    );

MaterialStateProperty<Color> _elevatedButtonBackgroundColor({
  Color? pressed,
  Color? disabled,
  Color? other,
}) {
  return MaterialStateProperty.resolveWith(
    (states) {
      if (states.contains(MaterialState.pressed)) {
        return pressed ?? AppColors.lightGreen;
      } else if (states.contains(MaterialState.disabled)) {
        return disabled ?? AppColors.lightGreen2;
      }
      return AppColors.lightGreen;
    },
  );
}
