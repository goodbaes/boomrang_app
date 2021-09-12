part of 'app_theme.dart';

ThemeData _darkTheme() {
  final baseTheme = AppTheme._baseTheme;
  return baseTheme.copyWith(
    accentColor: AppColors.lightGreen,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldDarkTheme,
    focusColor: Colors.white,
    textTheme: baseTheme.textTheme.apply(
      displayColor: Colors.white,
      bodyColor: Colors.white,
      decorationColor: Colors.white,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    cardColor: AppColors.dividerColorDarkTheme,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    dividerColor: AppColors.dividerColorDarkTheme,
    iconTheme: IconThemeData(color: AppColors.darkGrayIcon),
    shadowColor: Colors.white24,
    primaryColor: AppColors.darkGrayIcon,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      elevation: 0.0,
      selectedIconTheme: IconThemeData(
        color: AppColors.scaffoldDarkTheme,
        size: 28,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.darkGrayIcon,
        size: 28,
      ),
      backgroundColor: AppColors.scaffoldDarkTheme,
    ),
    hintColor: Colors.white54,
    elevatedButtonTheme: _elevatedButtonThemeData,
  );
}
