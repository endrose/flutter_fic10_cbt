import 'dart:html';
import 'dart:math';

import 'package:fic10_cbt/core/components/buttons.dart';
import 'package:fic10_cbt/core/extensions/build_context_ext.dart';
import 'package:fic10_cbt/presentation/auth/pages/login_page.dart';
// import 'package:fic10_cbt/core/extensions/build_context_ext.dart';
import 'package:fic10_cbt/presentation/onboarding/model/onboarding_model.dart';
import 'package:fic10_cbt/presentation/pages/onboarding_content.dart';
import 'package:fic10_cbt/presentation/pages/onboarding_indicator.dart';
// import 'package:fic10_cbt/presentation/widgets/skip_button.dart';
import 'package:flutter/material.dart';

import '../../core/assets/assets.gen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  final pageController = PageController();

  final onboardingData = [
    OnboardingModel(
      image: Assets.images.onboarding.screen1.path,
      text: 'Jelajahi Potensimu dengan Tes Online Akademik di CWB !',
    ),
    OnboardingModel(
      image: Assets.images.onboarding.screen2.path,
      text: 'Jelajahi Potensimu dengan Tes Online Akademik di CWB !',
    ),
    OnboardingModel(
      image: Assets.images.onboarding.screen3.path,
      text: 'Jelajahi Potensimu dengan Tes Online Akademik di CWB !',
    ),
  ];

  void navigate() {
    context.pushReplacement(const LoginPage());
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: 400.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.onboarding.ornament.path),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Column(
          children: [
            // SkipButton(
            //   // onPressed: navigate,
            // ),
            OnboardingContent(
                pageController: pageController,
                onPageChanged: (index) {
                  currentPage = index;
                  setState(() {});
                },
                contents: onboardingData),
            OnboardingIndicator(
              currentPage: currentPage,
              length: onboardingData.length,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Button.filled(
                  onPressed: () {
                    if (currentPage < onboardingData.length - 1) {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease);
                      currentPage++;
                      setState(() {});
                    } else {
                      navigate();
                    }
                  },
                  label: 'Continue'),
            ),
          ],
        )
      ]),
    );
  }
}
