import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/features/silver/data/repo/silver_repo.dart';
import 'package:goldy/features/silver/presentation/cubit/silver_state.dart';

class SilverCubit  extends Cubit<SilverState>{
  final SilverRepo silverRepo;

  SilverCubit({required this.silverRepo}) : super(SilverInitialState());

  Future<void> getSilver() async
  {
    emit(SilverLoadingState());
    final res = await silverRepo.getSilver();
    res.fold((error){
      emit(SilverFailureState(error));
    }, (success){
      emit(SilverSuccessState(silverModel: success));
    });
  }
}