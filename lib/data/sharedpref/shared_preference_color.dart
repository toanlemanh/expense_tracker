import 'dart:convert';
import 'dart:typed_data';
import 'package:expense_tracker/data/sharedpref/constants/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:palette_generator/palette_generator.dart';


class ImageColorStore {
  static final ImageColorStore _instance = ImageColorStore._internal();
  factory ImageColorStore() => _instance;

  late SharedPreferences _prefs;
  final Map<String, String> _colorCache = {}; // filePath -> hexColor

  ImageColorStore._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();

    final manifestJson = await rootBundle.loadString('AssetManifest.json');
    final manifest = json.decode(manifestJson) as Map<String, dynamic>;

    final pngFiles = manifest.keys
        .where(
          (path) => path.contains(Preferences.asset_png_path) 
          && path.endsWith('.png'))
        .toList();

    for (final path in pngFiles) {
      final bytes = await rootBundle.load(path);
      final hash = sha1.convert(bytes.buffer.asUint8List()).toString();
      final hashKey = '$path.hash';
      final colorKey = '$path.color';

      final existingHash = _prefs.getString(hashKey);

      if (existingHash != hash) {
        final avgHexColor = await _computeAverageColor(bytes.buffer.asUint8List());
        
        await _prefs.setString(hashKey, hash);
        await _prefs.setString(colorKey, avgHexColor);
        _colorCache[path] = avgHexColor;
      } else {
        _colorCache[path] = _prefs.getString(colorKey) ?? '#FFFFFFFF';
      }
    }
  }

  Future<String> _computeAverageColor(Uint8List imageData) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      MemoryImage(imageData),
    );

    // get average dominant color via PaletteGenerator
    final color = paletteGenerator.dominantColor?.color ??
        paletteGenerator.lightMutedColor?.color ??
        Colors.grey.shade200;

    // Convert to #AARRGGBB format
    final hex = '#'
        '${color.alpha.toRadixString(16).padLeft(2, '0')}'
        '${color.red.toRadixString(16).padLeft(2, '0')}'
        '${color.green.toRadixString(16).padLeft(2, '0')}'
        '${color.blue.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();

    return hex;
  }

  Color getAveriColor(String filePath) {
    final hex = _colorCache[filePath] ?? '#FFFFFFFF';
    final hexColor = hex.replaceFirst('#', '');
    final colorInt = int.parse(hexColor, radix: 16);
    return Color(colorInt);
  }

  Color getAveriColorLighter1(String filePath, [double amount = 0.18]) {
    final baseColor = getAveriColor(filePath);
    return _lightenColor(baseColor, amount);
  }

  Color getAveriColorLighter2(String filePath, [double amount = 0.32]) {
    final baseColor = getAveriColor(filePath);
    return _lightenColor(baseColor, amount);
  }


  Color getAveriColorLightest(String filePath, [double amount = 0.48]) {
    final baseColor = getAveriColor(filePath);
    return _lightenColor(baseColor, amount);
  }

  Color _lightenColor(Color color, double amount) {
    assert(amount >= 0.0 && amount <= 1.0);
    final hsl = HSLColor.fromColor(color);
    final lightened = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return lightened.toColor();
  }
}
