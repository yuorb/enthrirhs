import 'package:enthrirch/common/character/primary/mod.dart';
import 'package:enthrirch/common/character/secondary/mod.dart';
import 'package:enthrirch/common/character/tertiary/mod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'character/mod.dart';
import 'character/quarternary/mod.dart';
import 'character/quarternary/top.dart';
import 'character/quarternary/bottom.dart';
import 'character/tertiary/extensions.dart';
import 'utils.dart';

const double unitHeight = 35;
const double verticalPadding = unitHeight;
const double horizontalPadding = 20;
const double horizontalGap = 10;

class IthkuilSvg extends StatelessWidget {
  final List<Character> characters;

  const IthkuilSvg(this.characters, {super.key});

  @override
  Widget build(BuildContext context) {
    // 1 unit height = 35
    // core letter height = 2 unit height = 70
    // full letter height = 4 unit height = 140
    // full letter with padding height = 6 unit height = 210
    final String fillColor = colorToHex(Theme.of(context).textTheme.titleLarge!.color!);
    // final String fillColor = "#e6e1e6";

    final Map<String, String> usedRadicals = {};
    for (final p in characters.whereType<Primary>()) {
      usedRadicals[p.specification.name] = p.specification.path;
      usedRadicals[p.context.name] = p.context.path();
      usedRadicals[p.formativeType.id()] = p.formativeType.path();
      usedRadicals['${p.essence.name}_${p.affiliation.name}'] = p.componentA().path();
      usedRadicals['${p.perspective.name}_${p.extension.name}'] = p.componentB().path();
      usedRadicals['${p.separability.name}_${p.similarity.name}'] = p.componentC().path();
      usedRadicals['${p.function.name}_${p.version.name}_${p.plexity.name}_${p.stem.name}'] =
          p.componentD().path();
    }
    for (final s in characters.whereType<Secondary>()) {
      usedRadicals["${s.core.phoneme.defaultLetter()}_core"] = s.core.path;
      if (s.start != null) {
        usedRadicals[s.getStartExtId()!] = s.getStartExtPath()!;
      }
      if (s.end != null) {
        usedRadicals[s.getEndExtId()!] = s.getEndExtPath()!;
      }
    }
    for (final t in characters.whereType<Tertiary>()) {
      usedRadicals[t.top.name] = tertiaryExtensionPaths[t.top.name]!;
      usedRadicals[t.bottom.name] = tertiaryExtensionPaths[t.bottom.name]!;
      usedRadicals["valence_${t.valence.name}"] = t.valence.path();
      usedRadicals["level_${t.level.comparisonOperator.name}"] = t.level.comparisonOperator.path;
    }
    for (final q in characters.whereType<Quarternary>()) {
      usedRadicals["quarternary_${q.top.name}"] = quarternaryTopPaths[q.top.name]!;
      usedRadicals["quarternary_${q.bottom.name}"] = quarternaryBottomPaths[q.bottom.name]!;
    }
    if (characters.whereType<Quarternary>().isNotEmpty) {
      usedRadicals["quarternary_core"] = corePath;
    }

    List<String> charImages = [];
    double leftCoord = horizontalPadding;
    for (int i = 0; i < characters.length; i++) {
      final character = characters[i];
      const centerY = verticalPadding + unitHeight * 2;
      final (svgString, svgWidth) = character.getSvg(leftCoord, centerY, fillColor);
      charImages.add(svgString);
      leftCoord += svgWidth + horizontalGap;
    }
    final baseWidth = leftCoord - horizontalGap + horizontalPadding;

    return SvgPicture.string(
      '''<svg width="$baseWidth" height="${unitHeight * 6}">
        <defs>
          ${usedRadicals.entries.map(
            (e) => '<path stroke="none" id="${e.key}" d="${e.value}" />',
          ).join('\n')}
        </defs>
        <rect x="0" y="0" height="${unitHeight * 6}" width="$baseWidth" style="fill: transparent" />
        <line x1="0" y1="${unitHeight * 1}" x2="400" y2="${unitHeight * 1}" stroke="red" />
        <line x1="0" y1="${unitHeight * 2}" x2="400" y2="${unitHeight * 2}" stroke="red" />
        <line x1="0" y1="${unitHeight * 3}" x2="400" y2="${unitHeight * 3}" stroke="red" />
        <line x1="0" y1="${unitHeight * 4}" x2="400" y2="${unitHeight * 4}" stroke="red" />
        <line x1="0" y1="${unitHeight * 5}" x2="400" y2="${unitHeight * 5}" stroke="red" />
        ${charImages.join('\n')}
      </svg>''',
      width: MediaQuery.of(context).size.width - 32,
    );
  }
}
