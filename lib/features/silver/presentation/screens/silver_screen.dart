import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/utils/colors.dart';
import 'package:goldy/core/utils/text_styles.dart';
import 'package:goldy/components/buttons/custom_text.dart';
import 'package:goldy/features/silver/data/repo/silver_repo.dart';
import 'package:goldy/features/silver/presentation/cubit/silver_cubit.dart';
import 'package:goldy/features/silver/presentation/cubit/silver_state.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SilverCubit(silverRepo: SilverRepo())..getSilver(),
      child: Scaffold(
        backgroundColor: AppColors.darkColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.darkColor,
          title: Text(
            "Silver Price Tracker",
            style: TextStyles.textSize18.copyWith(
                color: AppColors.secondryColor, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.secondryColor,
            ),
          ),
        ),
        body: BlocBuilder<SilverCubit, SilverState>(
          builder: (context, state) {
            if (state is SilverLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SilverFailureState) {
              return Text(
                "Sometghing wrong --> ${state.errorMessage}",
              );
            } else if (state is SilverSuccessState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.silver,
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomText(
                      text: state.silverModel.price.toString(),
                      textColor: AppColors.secondryColor,
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
