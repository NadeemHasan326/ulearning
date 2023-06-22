import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearningap/blocs/on_boarding_bloc/on_boarding_event.dart';
import 'package:ulearningap/common/app_color.dart';
import 'package:ulearningap/common/image_constant.dart';
import 'package:ulearningap/screens/sign_up_and_login_screen.dart';

import '../blocs/on_boarding_bloc/on_boarding_bloc.dart';
import '../blocs/on_boarding_bloc/on_boarding_state.dart';
import '../widgets/text_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  OnBoardingBloc? _bloc;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _bloc = OnBoardingBloc()..add(InitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc!,
      child: Scaffold(
        body: BlocConsumer<OnBoardingBloc, OnBoardingState>(
          listener: (BuildContext context, OnBoardingState state) => {},
          builder: (BuildContext context, OnBoardingState state) =>
              _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _bloc!.sliderIndex = index;
              });
            },
            children: [
              _buildSliderPage(
                  index: 0,
                  context: context,
                  title: 'First see learning',
                  subTitle:
                      'Forgot about a for of paper all knowledge in one learning.',
                  buttonText: 'Next',
                  imageUrl: ImageConstant.first_u_learnning),
              _buildSliderPage(
                  index: 1,
                  context: context,
                  title: 'Connect with everyone',
                  subTitle: 'Always keep touch with you',
                  buttonText: 'Next',
                  imageUrl: ImageConstant.second_u_learnning),
              _buildSliderPage(
                  index: 2,
                  context: context,
                  title: 'First see learning',
                  subTitle:
                      'Forgot about a for of paper all knowledge in one learning.',
                  buttonText: 'Get Started',
                  imageUrl: ImageConstant.third_u_learnning),
            ],
          ),
          Positioned(
              bottom: 100,
              child: DotsIndicator(
                position: _bloc!.sliderIndex,
                dotsCount: 3,
                decorator: DotsDecorator(
                    color: AppColor.grey,
                    activeColor: AppColor.bluePurpleColor,
                    size: const Size.square(8),
                    activeSize: const Size(20, 8),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
              )),
        ],
      ),
    );
  }

  Widget _buildSliderPage(
      {int? index,
      BuildContext? context,
      String? title,
      String? subTitle,
      String? imageUrl,
      String? buttonText}) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context!).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextWidget(
            text: title,
            textStyle: const TextStyle(
                fontSize: 22,
                color: AppColor.blackBkColor,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5,
          ),
          TextWidget(
            text: subTitle,
            textAlign: TextAlign.center,
            textStyle: TextStyle(
                fontSize: 16, color: AppColor.blackBkColor.withOpacity(0.6)),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              _bloc!.sliderIndex = _bloc!.sliderIndex + 1;
              if (_bloc!.sliderIndex < 3) {
                _pageController.animateToPage(_bloc!.sliderIndex,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                setState(() {});
              } else {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const SignUpAndLoginScreen()),
                    (route) => false);
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.purpleTextColor,
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 2,
                        color: AppColor.grey,
                        offset: Offset(3, 3))
                  ]),
              alignment: Alignment.center,
              child: TextWidget(
                text: buttonText,
                textStyle: const TextStyle(fontSize: 18, color: AppColor.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
