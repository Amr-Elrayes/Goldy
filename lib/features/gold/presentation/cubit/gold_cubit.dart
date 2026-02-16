import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/features/gold/data/repo/gold_repo.dart';
import 'package:goldy/features/gold/presentation/cubit/gold_state.dart';

class GoldCubit  extends Cubit<GoldState>{
  final GoldRepo goldRepo;

  GoldCubit({required this.goldRepo}) : super(GoldInitialState());

  Future<void> getGold() async
  {
    emit(GoldLoadingState());
    final res = await goldRepo.getGold();
    res.fold((error){
      emit(GoldFailureState(error));
    }, (success){
      emit(GoldSuccessState(goldModel: success));
    });
  }
}