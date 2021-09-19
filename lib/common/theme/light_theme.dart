part of 'app_theme.dart';

ThemeData _lightTheme() {
  final baseTheme = AppTheme._baseTheme;
  return baseTheme.copyWith(
    accentColor: AppColors.lightGreen,
    brightness: Brightness.light,
    focusColor: Colors.lightGreen,
    scaffoldBackgroundColor: Colors.white,
    textTheme: baseTheme.textTheme.apply(
      displayColor: Colors.black,
      bodyColor: Colors.black,
      decorationColor: Colors.black,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    chipTheme:
        baseTheme.chipTheme.copyWith(backgroundColor: AppColors.lightGrayIcon),
    dividerColor: AppColors.lightGrayIcon,
    iconTheme: IconThemeData(color: AppColors.lightGrayIcon),
    shadowColor: Colors.black,
    primaryColor: AppColors.lightGreen,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      elevation: 0.0,
      selectedIconTheme: IconThemeData(
        color: Colors.white,
        size: 28,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.lightGrayIcon,
        size: 28,
      ),
      backgroundColor: Colors.white,
    ),
    hintColor: Colors.black26,
    buttonColor: AppColors.lightGreen,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: baseTheme.elevatedButtonTheme.style?.copyWith(
        backgroundColor: _elevatedButtonBackgroundColor(
          other: AppColors.lightGreen,
          pressed: AppColors.lightGreen2,
        ),
      ),
    ),
  );
}
