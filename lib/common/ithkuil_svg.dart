import 'package:enthrirch/common/character/primary/mod.dart';
import 'package:enthrirch/common/character/secondary/mod.dart';
import 'package:enthrirch/common/character/tertiary/mod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'character/mod.dart';
import 'character/primary/a_anchor.dart';
import 'character/primary/b_anchor.dart';
import 'character/primary/c_anchor.dart';
import 'character/primary/d_anchor.dart';
import 'character/primary/top.dart';
import 'character/quarternary/mod.dart';
import 'character/quarternary/top.dart';
import 'character/quarternary/bottom.dart';
import 'character/tertiary/extensions.dart';
import 'character/tertiary/valence.dart';
import 'utils.dart';

class IthkuilSvg extends StatelessWidget {
  final List<Character> characters;

  const IthkuilSvg(this.characters, {super.key});

  @override
  Widget build(BuildContext context) {
    // 1 unit height = 35
    // core letter height = 2 unit height = 70
    // full letter height = 4 unit height = 140
    // full letter with padding height = 6 unit height = 210
    const double unitHeight = 35;
    const double verticalPadding = unitHeight;
    const double horizontalPadding = 20;
    const double horizontalGap = 10;
    final String fillColor = colorToHex(Theme.of(context).textTheme.titleLarge!.color!);
    // final String fillColor = "#e6e1e6";

    final usedSpecifications =
        characters.whereType<Primary>().map((s) => s.specification).toSet().toList();
    final List<(String, String)> usedPrimaryTops = characters
        .whereType<Primary>()
        .map((s) => (s.context.name, topData[s.context.name]!))
        .toSet()
        .toList();
    final List<(String, String)> usedAAnchors = characters
        .whereType<Primary>()
        .map(
          (s) => (
            '${s.essence.name}_${s.affiliation.name}',
            aAnchorData[s.essence.name]![s.affiliation.name]!
          ),
        )
        .toSet()
        .toList();
    final List<(String, String)> usedBAnchors = characters
        .whereType<Primary>()
        .map(
          (s) => (
            '${s.perspective.name}_${s.extension.name}',
            bAnchorData[s.perspective.name]![s.extension.name]!
          ),
        )
        .toSet()
        .toList();
    final List<(String, String)> usedCAnchors = characters
        .whereType<Primary>()
        .map(
          (s) => (
            '${s.separability.name}_${s.similarity.name}',
            cAnchorData[s.similarity.name]![s.separability.name]!
          ),
        )
        .toSet()
        .toList();
    final List<(String, String)> usedDAnchors = characters
        .whereType<Primary>()
        .map(
          (s) => (
            '${s.function.name}_${s.version.name}_${s.plexity.name}_${s.stem.name}',
            dAnchorData[s.function.name]![s.version.name]![s.plexity.name]![s.stem.name]!,
          ),
        )
        .toSet()
        .toList();
    final List<(String, String)> usedExtensions = characters
        .whereType<Secondary>()
        .map<List<(String, String)?>>((s) {
          final start = s.start;
          final end = s.end;
          return [
            start != null
                ? (
                    "${start.phoneme.romanizedLetters[0]}_ext_${s.startAnchor.orientation.filename}",
                    start.path
                  )
                : null,
            end != null
                ? (
                    "${end.phoneme.romanizedLetters[0]}_ext_${s.endAnchor.orientation.filename}",
                    end.path
                  )
                : null
          ];
        })
        .expand((element) => element)
        .whereType<(String, String)>()
        .toSet()
        .toList();
    final usedCores = characters.whereType<Secondary>().map((s) => s.core).toSet().toList();
    final usedValences = characters.whereType<Tertiary>().map((s) => s.valence).toSet().toList();
    final usedTertiaryExtensions = characters
        .whereType<Tertiary>()
        .map((s) => [s.top, s.bottom])
        .expand((element) => element)
        .toSet()
        .toList();
    final hasQuarternary = characters.whereType<Quarternary>().isNotEmpty;
    final List<(String, String)> usedQuarternaryTops = characters
        .whereType<Quarternary>()
        .map((s) => ("quarternary_${s.top.name}", quarternaryTopPaths[s.top.name]!))
        .toList();
    final List<(String, String)> usedQuarternaryBottoms = characters
        .whereType<Quarternary>()
        .map((s) => ("quarternary_${s.bottom.name}", quarternaryBottomPaths[s.bottom.name]!))
        .toList();

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
          ${hasQuarternary ? '<path stroke="none" id="quarternary_core" d="$corePath" />' : ''}
          ${usedSpecifications.map(
            (e) => '<path stroke="none" id="${e.name}" d="${e.path}" />',
          ).join('')}
          ${usedPrimaryTops.map(
            (e) => '<path stroke="none" id="${e.$1}" d="${e.$2}" />',
          ).join('')}
          ${usedAAnchors.map(
            (e) => '<path stroke="none" id="${e.$1}" d="${e.$2}" />',
          ).join('')}
          ${usedBAnchors.map(
            (e) => '<path stroke="none" id="${e.$1}" d="${e.$2}" />',
          ).join('')}
          ${usedCAnchors.map(
            (e) => '<path stroke="none" id="${e.$1}" d="${e.$2}" />',
          ).join('')}
          ${usedDAnchors.map(
            (e) => '<path stroke="none" id="${e.$1}" d="${e.$2}" />',
          ).join('')}
          ${usedCores.map(
            (e) =>
                '<path stroke="none" id="${e.phoneme.romanizedLetters[0]}_core" d="${e.path}" />',
          ).join('')}
          ${usedExtensions.map(
            (e) => '<path stroke="none" id="${e.$1}" d="${e.$2}" />',
          ).join('')}
          ${usedValences.map(
            (e) => '<path stroke="none" id="${e.name}" d="${valencePaths[e.name]}" />',
          ).join('')}
          ${usedTertiaryExtensions.map(
            (e) => '<path stroke="none" id="${e.name}" d="${tertiaryExtensionPaths[e.name]}" />',
          ).join('')}
          ${usedQuarternaryTops.map(
            (e) => '<path stroke="none" id="${e.$1}" d="${e.$2}" />',
          ).join('')}
          ${usedQuarternaryBottoms.map(
            (e) => '<path stroke="none" id="${e.$1}" d="${e.$2}" />',
          ).join('')}
        </defs>
        <rect x="0" y="0" height="${unitHeight * 6}" width="$baseWidth" style="fill: transparent" />
        ${charImages.join('\n')}
      </svg>''',
      width: MediaQuery.of(context).size.width - 32,
    );
  }
}
