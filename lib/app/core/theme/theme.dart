import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281426573),
      surfaceTint: Color(4281426573),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4291814911),
      onPrimaryContainer: Color(4278197555),
      secondary: Color(4283588720),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292207863),
      onSecondaryContainer: Color(4279115050),
      tertiary: Color(4285093753),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293909503),
      onTertiaryContainer: Color(4280489267),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294441471),
      onSurface: Color(4279770144),
      onSurfaceVariant: Color(4282533710),
      outline: Color(4285691775),
      outlineVariant: Color(4290955215),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inversePrimary: Color(4288465915),
      primaryFixed: Color(4291814911),
      onPrimaryFixed: Color(4278197555),
      primaryFixedDim: Color(4288465915),
      onPrimaryFixedVariant: Color(4279323251),
      secondaryFixed: Color(4292207863),
      onSecondaryFixed: Color(4279115050),
      secondaryFixedDim: Color(4290365658),
      onSecondaryFixedVariant: Color(4282009687),
      tertiaryFixed: Color(4293909503),
      onTertiaryFixed: Color(4280489267),
      tertiaryFixedDim: Color(4292132582),
      onTertiaryFixedVariant: Color(4283449441),
      surfaceDim: Color(4292401888),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112249),
      surfaceContainer: Color(4293717748),
      surfaceContainerHigh: Color(4293322990),
      surfaceContainerHighest: Color(4292928232),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278797935),
      surfaceTint: Color(4281426573),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283005092),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281746515),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285036166),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283186268),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286541201),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441471),
      onSurface: Color(4279770144),
      onSurfaceVariant: Color(4282270538),
      outline: Color(4284112742),
      outlineVariant: Color(4285954946),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inversePrimary: Color(4288465915),
      primaryFixed: Color(4283005092),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281229194),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285036166),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283391341),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286541201),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284896631),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292401888),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112249),
      surfaceContainer: Color(4293717748),
      surfaceContainerHigh: Color(4293322990),
      surfaceContainerHighest: Color(4292928232),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278199358),
      surfaceTint: Color(4281426573),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278797935),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279575345),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281746515),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280949818),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283186268),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441471),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280230954),
      outline: Color(4282270538),
      outlineVariant: Color(4282270538),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151797),
      inversePrimary: Color(4292931071),
      primaryFixed: Color(4278797935),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202190),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281746515),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280299068),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283186268),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281673285),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292401888),
      surfaceBright: Color(4294441471),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112249),
      surfaceContainer: Color(4293717748),
      surfaceContainerHigh: Color(4293322990),
      surfaceContainerHighest: Color(4292928232),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288465915),
      surfaceTint: Color(4288465915),
      onPrimary: Color(4278203220),
      primaryContainer: Color(4279323251),
      onPrimaryContainer: Color(4291814911),
      secondary: Color(4290365658),
      onSecondary: Color(4280562240),
      secondaryContainer: Color(4282009687),
      onSecondaryContainer: Color(4292207863),
      tertiary: Color(4292132582),
      onTertiary: Color(4281936457),
      tertiaryContainer: Color(4283449441),
      onTertiaryContainer: Color(4293909503),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279243800),
      onSurface: Color(4292928232),
      onSurfaceVariant: Color(4290955215),
      outline: Color(4287402393),
      outlineVariant: Color(4282533710),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928232),
      inversePrimary: Color(4281426573),
      primaryFixed: Color(4291814911),
      onPrimaryFixed: Color(4278197555),
      primaryFixedDim: Color(4288465915),
      onPrimaryFixedVariant: Color(4279323251),
      secondaryFixed: Color(4292207863),
      onSecondaryFixed: Color(4279115050),
      secondaryFixedDim: Color(4290365658),
      onSecondaryFixedVariant: Color(4282009687),
      tertiaryFixed: Color(4293909503),
      onTertiaryFixed: Color(4280489267),
      tertiaryFixedDim: Color(4292132582),
      onTertiaryFixedVariant: Color(4283449441),
      surfaceDim: Color(4279243800),
      surfaceBright: Color(4281743678),
      surfaceContainerLowest: Color(4278914578),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280756783),
      surfaceContainerHighest: Color(4281480506),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288794623),
      surfaceTint: Color(4288465915),
      onPrimary: Color(4278196267),
      primaryContainer: Color(4284913090),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290694367),
      onSecondary: Color(4278785829),
      secondaryContainer: Color(4286878371),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4292396010),
      onTertiary: Color(4280160045),
      tertiaryContainer: Color(4288448942),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279243800),
      onSurface: Color(4294638335),
      onSurfaceVariant: Color(4291218387),
      outline: Color(4288586667),
      outlineVariant: Color(4286481291),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928232),
      inversePrimary: Color(4279454580),
      primaryFixed: Color(4291814911),
      onPrimaryFixed: Color(4278194723),
      primaryFixedDim: Color(4288465915),
      onPrimaryFixedVariant: Color(4278204765),
      secondaryFixed: Color(4292207863),
      onSecondaryFixed: Color(4278456863),
      secondaryFixedDim: Color(4290365658),
      onSecondaryFixedVariant: Color(4280956742),
      tertiaryFixed: Color(4293909503),
      onTertiaryFixed: Color(4279765544),
      tertiaryFixedDim: Color(4292132582),
      onTertiaryFixedVariant: Color(4282331215),
      surfaceDim: Color(4279243800),
      surfaceBright: Color(4281743678),
      surfaceContainerLowest: Color(4278914578),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280756783),
      surfaceContainerHighest: Color(4281480506),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294638335),
      surfaceTint: Color(4288465915),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288794623),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294638335),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290694367),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965756),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292396010),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279243800),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294638335),
      outline: Color(4291218387),
      outlineVariant: Color(4291218387),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928232),
      inversePrimary: Color(4278201418),
      primaryFixed: Color(4292340223),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288794623),
      onPrimaryFixedVariant: Color(4278196267),
      secondaryFixed: Color(4292536571),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290694367),
      onSecondaryFixedVariant: Color(4278785829),
      tertiaryFixed: Color(4294107391),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4292396010),
      onTertiaryFixedVariant: Color(4280160045),
      surfaceDim: Color(4279243800),
      surfaceBright: Color(4281743678),
      surfaceContainerLowest: Color(4278914578),
      surfaceContainerLow: Color(4279770144),
      surfaceContainer: Color(4280033316),
      surfaceContainerHigh: Color(4280756783),
      surfaceContainerHighest: Color(4281480506),
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
     scaffoldBackgroundColor: colorScheme.background,
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
