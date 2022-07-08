import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/global_widgets/custom_button.dart';
import '../../../models/onboarding_model.dart';
import '../../profile/profile_screen.dart';

class OnboardingBodyWidget extends StatelessWidget {
  const OnboardingBodyWidget({
    Key? key,
    required this.model,
    this.isLastPage = false,
    required this.pageViewScrollController,
  }) : super(key: key);

  final OnboardingModel model;
  final bool? isLastPage;
  final PageController pageViewScrollController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildOnboardingImage(context),
        _buildOnboardingPageIndicator(),
        SizedBox(
          height: 40.h,
        ),
        _buildOnboardingTexts(),
        SizedBox(
          height: 33.82.h,
        ),
        const Spacer(),
        isLastPage == true ? _lastPageOnboarding(context) : _otherOnboardings(),
        SizedBox(height: 18.h),
      ],
    );
  }

  Widget _otherOnboardings() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButton(
          buttonText: "Skip",
          hasBackgroundColor: false,
          onPressed: () {
            pageViewScrollController.animateToPage(
              2,
              duration: kThemeAnimationDuration,
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
        ),
        CustomButton(
          buttonText: "Next",
          hasBackgroundColor: true,
          onPressed: () {
            pageViewScrollController.animateToPage(
              model.pageIndex + 1,
              duration: kThemeAnimationDuration,
              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
        ),
      ],
    );
  }

  Widget _lastPageOnboarding(context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          },
          child: Container(
            height: 46.w,
            width: 343.w,
            decoration: BoxDecoration(
              color: linkedinBlue,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/linkedin.png",
                    height: 22,
                    width: 24.26,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    "Get Started With Linkedin",
                    style: buttonTextStyle.copyWith(
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 38.h,
        ),
        InkWell(
          child: Text(
            "Continue as a guest",
            style: linkText,
          ),
        ),
      ],
    );
  }

  Padding _buildOnboardingTexts() {
    return Padding(
      padding: EdgeInsets.only(left: 38.w, right: 38.w),
      child: Column(
        children: [
          Text(
            model.pageTitle,
            style: headline2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            model.pageDescription,
            style: body1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Row _buildOnboardingPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 6,
              width: model.pageIndex == i ? 28 : 6,
              decoration: BoxDecoration(
                borderRadius:
                    model.pageIndex == i ? BorderRadius.circular(20) : null,
                color: model.pageIndex == i ? indigoBlue : grey,
                shape:
                    model.pageIndex == i ? BoxShape.rectangle : BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  SizedBox _buildOnboardingImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        model.imagePath,
        fit: BoxFit.contain,
      ),
    );
  }
}
