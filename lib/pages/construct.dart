import 'package:enthrirhs/libs/ithkuil/writing/primary/mod.dart';
import 'package:enthrirhs/libs/ithkuil/writing/quarternary/mod.dart';
import 'package:enthrirhs/libs/ithkuil/writing/secondary/core_letter.dart';
import 'package:enthrirhs/libs/ithkuil/writing/secondary/ext_letter.dart';
import 'package:enthrirhs/libs/ithkuil/writing/secondary/mod.dart';
import 'package:enthrirhs/libs/ithkuil/writing/tertiary/extensions.dart';
import 'package:enthrirhs/libs/ithkuil/writing/tertiary/mod.dart';
import 'package:flutter/material.dart';

import 'package:enthrirhs/components/ithkuil_svg.dart';
import 'package:provider/provider.dart';

import '../components/list_group_title.dart';
import '../libs/ithkuil/mod.dart';
import '../libs/ithkuil/terms/mod.dart';

class ConstructPageRoots with ChangeNotifier {
  List<Formative> formatives = [];

  ConstructPageRoots();

  void push(String root) {
    formatives.add(Formative(
      stem: Stem.s1,
      root: root,
      specification: Specification.bsc,
      context: Context.exs,
      function: Function$.sta,
      formativeType: const Standalone(Noun(Case.thm)),
      version: Version.prc,
      affiliation: Affiliation.csl,
      configuration: Configuration.from(Plexity.u, null, null)!,
      extension: Extension.del,
      perspective: Perspective.m,
      essence: Essence.nrm,
      csVxAffixes: [],
      vxCsAffixes: [],
      vnCn: const Pattern1(
        vn: ValenceVn(Valence.mno),
        cn: MoodCn(Mood.fac),
      ),
    ));
    notifyListeners();
  }

  void removeAt(int index) {
    formatives.removeAt(index);
    notifyListeners();
  }
}

class ConstructPage extends StatefulWidget {
  const ConstructPage({super.key});

  @override
  State<ConstructPage> createState() => _ConstructPageState();
}

class _ConstructPageState extends State<ConstructPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: context.watch<ConstructPageRoots>().formatives.length,
      child: Builder(
        builder: (context) => Column(
          children: [
            AppBar(title: const Text("Construct")),
            const SizedBox(height: 16),
            const IthkuilSvg(
              [
                Primary(
                  specification: Specification.cte,
                  context: Context.rps,
                  formativeType: Concatenated(concatenation: Concatenation.type2, format: Case.abl),
                  essence: Essence.rpv,
                  affiliation: Affiliation.csl,
                  perspective: Perspective.m,
                  extension: Extension.prx,
                  similarity: Similarity.d,
                  separability: Separability.s,
                  function: Function$.sta,
                  version: Version.prc,
                  plexity: Plexity.u,
                  stem: Stem.s1,
                ),
                Root(
                  start: ExtLetter.b,
                  core: CoreLetter.placeholder,
                  end: ExtLetter.c,
                ),
                CsVxAffixes(
                  start: ExtLetter.d,
                  core: CoreLetter.s,
                  end: ExtLetter.k,
                  degree: Degree.d1,
                  affixType: AffixType.type2,
                ),
                VxCsAffixes(
                  start: ExtLetter.d,
                  core: CoreLetter.s,
                  end: ExtLetter.k,
                  degree: Degree.d2,
                  affixType: AffixType.type3,
                ),
                Tertiary(
                  valence: Valence.mno,
                  top: AspectExtension(Aspect.atp),
                  bottom: AspectExtension(Aspect.atp),
                  level: Level(
                    comparison: Comparison.absolute,
                    comparisonOperator: ComparisonOperator.equ,
                  ),
                ),
                Quarternary(
                  relation: UnframedVerb(
                    illocution: Illocution.dec,
                    validation: Validation.ima,
                  ),
                  cn: MoodCn(Mood.sub),
                ),
              ],
            ),
            TabBar(
              isScrollable: true,
              tabs: context
                  .watch<ConstructPageRoots>()
                  .formatives
                  .map((formative) => Tab(child: Text(formative.root)))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                children: context.watch<ConstructPageRoots>().formatives.map((formative) {
                  return ListView(children: [
                    const ListGroupTitle("Definition"),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Root"),
                      subtitle: Text(formative.root),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Stem"),
                      subtitle: const Text("Stem 1"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Specification"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Text(
                        "(to be ontologically the) self-same entity (as) (i.e., [to be] simply another name for the self-same entity)",
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    const ListGroupTitle("Basic"),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Version"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Function"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Context"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    const ListGroupTitle("Ca"),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Affiliation"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Plexity"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Similarity"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Separability"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Extension"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Perspective"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Essence"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    const ListGroupTitle("Relation etc."),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Essence"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Case"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    // ListTile(
                    //   leading: const Icon(Icons.library_books),
                    //   title: const Text("Illocution"),
                    //   subtitle: const Text("BSC"),
                    //   onTap: () {},
                    // ),
                    // ListTile(
                    //   leading: const Icon(Icons.library_books),
                    //   title: const Text("Validation"),
                    //   subtitle: const Text("BSC"),
                    //   onTap: () {},
                    // ),
                    const ListGroupTitle("VnCn"),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Vn"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.library_books),
                      title: const Text("Cn"),
                      subtitle: const Text("BSC"),
                      onTap: () {},
                    ),
                    ListGroupTitle(
                      "Affixes CsVx",
                      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    ),
                    ListGroupTitle(
                      "Affixes VxCs",
                      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    ),
                    const ListGroupTitle("Operation"),
                    ListTile(
                      leading: const Icon(Icons.delete),
                      title: const Text("Delete"),
                      subtitle: const Text("Delete this formative"),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext dialogContext) => AlertDialog(
                            title: const Text("Confirm"),
                            content: const Text("Are you sure to remove this formative?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(dialogContext),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  Navigator.pop(dialogContext);
                                  final index = DefaultTabController.of(context).index;
                                  context.read<ConstructPageRoots>().removeAt(index);
                                },
                                child: const Text("Ok"),
                              ),
                            ],
                          ),
                        );
                      },
                      tileColor: Theme.of(context).colorScheme.errorContainer,
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
