import '../../terms/relation.dart';

enum Concatenation {
  type1('M 5.00 -17.50 L -5.00 -7.50 -5.00 17.50 5.00 7.50 5.00 -17.50 Z'),
  type2('M 7.60 0.00 L -1.20 8.80 0.00 10.00 20.00 -10.00 -10.00 -10.00 -20.00 0.00 7.60 0.00 Z');

  final String path;
  const Concatenation(this.path);
}

sealed class FormativeType {
  const FormativeType();

  String id() {
    return switch (this) {
      Standalone(relation: final relation) => relation.id(),
      Parent(relation: final relation) => relation.id(),
      Concatenated(concatenation: final concatenation) => "concatenation_${concatenation.name}",
    };
  }

  String path() {
    return switch (this) {
      Standalone(relation: final relation) => relation.path(),
      Parent(relation: final relation) => relation.path(),
      Concatenated(concatenation: final concatenation) => concatenation.path,
    };
  }
}

class Standalone extends FormativeType {
  final Relation relation;
  const Standalone(this.relation);
}

class Parent extends FormativeType {
  final Relation relation;
  const Parent(this.relation);
}

class Concatenated extends FormativeType {
  final Concatenation concatenation;
  const Concatenated(this.concatenation);
}
