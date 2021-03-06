part of 'app_theme.dart';

ThemeData _lightTheme() {
  final baseTheme = AppTheme._baseTheme;
  return baseTheme.copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: baseTheme.textTheme.apply(
      displayColor: Colors.black,
      bodyColor: Colors.black,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      actionsIconTheme: IconThemeData(color: Colors.black),
    ),
    dividerColor: AppColors.lightGrayIcon,
    iconTheme: IconThemeData(color: AppColors.lightGrayIcon),
    shadowColor: Colors.black,
    primaryColor: AppColors.lightGrayIcon,
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
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: baseTheme.elevatedButtonTheme.style?.copyWith(
        backgroundColor: _elevatedButtonBackgroundColor(
          pressed: AppColors.orangeButtonPressed,
        ),
      ),
    ),
  );
}
