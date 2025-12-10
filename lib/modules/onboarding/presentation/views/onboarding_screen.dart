import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OnboardingShowInfoCubit()),
        BlocProvider(create: (context) => OnboardingCubit()),
      ],
      child: OnBoardingView(),
    );
  }
}

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<OnboardingEntity> onboardingData = context
        .read<OnboardingShowInfoCubit>()
        .onboardingContent(context);
    return Scaffold(
      backgroundColor: context.customTheme.backgroundPrimary,
      // appBar: AppBar(backgroundColor: context.customTheme.backgroundPrimary),
      body: OnboardingPageView(
        pageController: _pageController,
        onboardingEntities: onboardingData,
      ),
      bottomNavigationBar: OnboardingNavbarWidget(
        pageController: _pageController,
        pageCount: onboardingData.length,
      ),
    );
  }
}
