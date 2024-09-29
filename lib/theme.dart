import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5c5f61),
      surfaceTint: Color(0xff5c5f61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xfff4f6f8),
      onPrimaryContainer: Color(0xff505455),
      secondary: Color(0xff446900),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff79ae24),
      onSecondaryContainer: Color(0xff0a1400),
      tertiary: Color(0xff5d5f5f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffd8d9d9),
      onTertiaryContainer: Color(0xff404343),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff444749),
      outline: Color(0xff747779),
      outlineVariant: Color(0xffc4c7c9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffc4c7c9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff404345),
      surfaceTint: Color(0xff5c5f61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff727577),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2f4a00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff558100),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff414343),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff737575),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff404345),
      outline: Color(0xff5c5f61),
      outlineVariant: Color(0xff787b7d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffc4c7c9),
      
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1f2324),
      surfaceTint: Color(0xff5c5f61),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff404345),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff172700),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2f4a00),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff202323),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff414343),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff212426),
      outline: Color(0xff404345),
      outlineVariant: Color(0xff404345),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffeaecee),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffc4c7c9),
      onPrimary: Color(0xff2d3133),
      primaryContainer: Color(0xffd2d5d7),
      onPrimaryContainer: Color(0xff3c4042),
      secondary: Color(0xffa0d74c),
      onSecondary: Color(0xff213600),
      secondaryContainer: Color(0xff558100),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xfff9f9f9),
      onTertiary: Color(0xff2e3131),
      tertiaryContainer: Color(0xffcecfcf),
      onTertiaryContainer: Color(0xff3a3c3c),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc4c7c9),
      outline: Color(0xff8e9193),
      outlineVariant: Color(0xff444749),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff5c5f61),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffc4c7c9),
      onPrimary: Color(0xff2d3133),
      primaryContainer: Color(0xffd2d5d7),
      onPrimaryContainer: Color(0xff1d2022),
      secondary: Color(0xffa4dc50),
      onSecondary: Color(0xff0e1a00),
      secondaryContainer: Color(0xff6c9f13),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff9f9f9),
      onTertiary: Color(0xff2e3131),
      tertiaryContainer: Color(0xffcecfcf),
      onTertiaryContainer: Color(0xff191b1b),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xfffefaf9),
      onSurfaceVariant: Color(0xffc8cbcd),
      outline: Color(0xffa0a3a5),
      outlineVariant: Color(0xff808386),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff45484a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffc4c7c9),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffd2d5d7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff5ffde),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffa4dc50),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffafbfb),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcecfcf),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff9fbfd),
      outline: Color(0xffc8cbcd),
      outlineVariant: Color(0xffc8cbcd),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff272a2c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
