import 'package:flutter/material.dart';
import 'package:greenmusk_test/models/onboarding_model.dart';
import 'package:greenmusk_test/views/authentication/widgets/onboarding_body_widget.dart';

class BaseOnboardingScreen extends StatelessWidget {
  BaseOnboardingScreen({Key? key}) : super(key: key);

  final PageController _pageController = PageController();
  final ValueNotifier<int> _pageIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: ValueListenableBuilder<int>(
            valueListenable: _pageIndex,
            builder: (context, value, _) {
              return PageView.builder(
                controller: _pageController,
                itemBuilder: (context, index) {
                  return OnboardingBodyWidget(
                    model: OnboardingModel.onboardingDatas[index],
                    pageViewScrollController: _pageController,
                    isLastPage:
                        index == OnboardingModel.onboardingDatas.length - 1,
                  );
                },
                itemCount: OnboardingModel.onboardingDatas.length,
                onPageChanged: (pageIndex) {
                  value = pageIndex;
                },
              );
            }),
      ),
    );
  }
}
