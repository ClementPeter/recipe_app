import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:receipe_app/app/app.locator.dart';
import 'package:receipe_app/enums/snackbar_type.dart';
import 'package:receipe_app/ui/common/app_colors.dart';
import 'package:receipe_app/ui/common/app_images.dart';
import 'package:stacked_services/stacked_services.dart';

void setupAuthSnackbarUI() {
  final snackbarService = locator<SnackbarService>();

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.custom,
    config: SnackbarConfig(
      backgroundColor: AppColors.paleRed,
      icon: SvgPicture.asset(AppImages.cancel),
      borderRadius: 30,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      textColor: AppColors.redShade,
      snackPosition: SnackPosition.TOP,
    ),
  );
}
