import 'package:goldy/features/gold/data/models/gold_model.dart';

class GoldState {}

class GoldInitialState extends GoldState {}

class GoldLoadingState extends GoldState {}

class GoldSuccessState extends GoldState {
  final GoldModel goldModel;

  GoldSuccessState({required this.goldModel});
}

class GoldFailureState extends GoldState {
  final String errorMessage;
  GoldFailureState(this.errorMessage);
}