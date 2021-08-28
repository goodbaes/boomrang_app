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
            color: Colors.white,
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
        return pressed ?? AppColors.orangeButtonPressed;
      } else if (states.contains(MaterialState.disabled)) {
        return disabled ?? AppColors.mainBlue;
      } else {
        return other ?? AppColors.mainBlue;
      }
    },
  );
}
