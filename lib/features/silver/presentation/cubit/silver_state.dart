
import 'package:goldy/features/silver/data/models/silver_model.dart';

class SilverState {}

class SilverInitialState extends SilverState {}

class SilverLoadingState extends SilverState {}

class SilverSuccessState extends SilverState {
  final SilverModel silverModel;

  SilverSuccessState({required this.silverModel});
}

class SilverFailureState extends SilverState {
  final String errorMessage;
  SilverFailureState(this.errorMessage);
}