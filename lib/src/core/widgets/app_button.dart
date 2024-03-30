import 'package:flutter/material.dart';
import 'package:nyntax_car/src/core/utils/constants.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const AppButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.padding * 2,
            horizontal: AppSizes.padding * 7,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.white,
              ),
        ));
  }
}
