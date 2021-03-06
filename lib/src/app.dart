import 'package:canton_design_system/canton_design_system.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CantonApp extends StatelessWidget {
  final String title;
  final Widget home;
  final Color primaryLightColor;
  final Color primaryDarkColor;
  final Color primaryLightVariantColor;
  final Color primaryDarkVariantColor;

  const CantonApp({
    this.title,
    this.home,
    this.primaryLightColor,
    this.primaryDarkColor,
    this.primaryLightVariantColor = CantonColors.blue,
    this.primaryDarkVariantColor = CantonDarkColors.blue,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final repo = watch(themeProvider);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        themeMode: repo.themeMode,
        theme: cantonLightTheme().copyWith(
          primaryColor: primaryLightColor,
          colorScheme: cantonLightTheme()
              .colorScheme
              .copyWith(primaryVariant: primaryLightVariantColor),
        ),
        darkTheme: cantonDarkTheme().copyWith(
          primaryColor: primaryDarkColor,
          colorScheme: cantonDarkTheme()
              .colorScheme
              .copyWith(primaryVariant: primaryDarkVariantColor),
        ),
        home: home,
      );
    });
  }
}
