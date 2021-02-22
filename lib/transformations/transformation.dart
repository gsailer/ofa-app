import 'package:ofa_v0/repositories.dart';

abstract class Transformation {
  Future<bool> calcTransformation(DFRepository dataframe);
}
