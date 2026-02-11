import 'package:flutter/material.dart';
import 'package:goldy/components/buttons/custom_buttom.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButtom(
              txt: AppStrings.gold,
              onPressed: () {},
            ),
            const SizedBox(
              height: 50,
            ),
            customButtom(
              txt: AppStrings.silver,
              onPressed: () {},
              color: AppColors.secondryColor,
              borderColor: AppColors.secondryColor,
            ),
          ],
        ),
      ),
    );
  }
}
