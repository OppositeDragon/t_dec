import 'package:flex_color_scheme/flex_color_scheme.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.tealM3,
  usedColors: 7,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useM2StyleDividerInM3: true,
  ),
  useMaterial3: true,
);
final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.cyanM3,
  usedColors: 7,
  surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
  blendLevel: 2,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useM2StyleDividerInM3: true,
  ),
  useMaterial3: true,
);
