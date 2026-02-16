import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/utils/colors.dart';
import 'package:goldy/core/utils/text_styles.dart';
import 'package:goldy/features/gold/data/repo/gold_repo.dart';
import 'package:goldy/features/gold/presentation/cubit/gold_cubit.dart';
import 'package:goldy/features/gold/presentation/cubit/gold_state.dart';
import 'package:goldy/components/buttons/custom_text.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(goldRepo: GoldRepo())..getGold(),
      child: Scaffold(
        backgroundColor: AppColors.darkColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.darkColor,
          title: Text(
            "Gold Price Tracker",
            style: TextStyles.textSize18.copyWith(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            if (state is GoldLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GoldFailureState) {
              return Text(
                "Sometghing wrong --> ${state.errorMessage}",
                style: TextStyle(color: Colors.white),
              );
            } else if (state is GoldSuccessState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.gold,
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: state.goldModel.price.toString(),
                      textColor: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
