import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearningap/blocs/sign_up_and_login_bloc/login_and_sign_up_event.dart';
import 'package:ulearningap/common/app_color.dart';
import 'package:ulearningap/common/image_constant.dart';

import '../blocs/sign_up_and_login_bloc/login_and_sign_up_bloc.dart';
import '../blocs/sign_up_and_login_bloc/login_and_sign_up_state.dart';
import '../widgets/text_widget.dart';

class SignUpAndLoginScreen extends StatefulWidget {
  const SignUpAndLoginScreen({super.key});

  @override
  State<SignUpAndLoginScreen> createState() => _SignUpAndLoginScreenState();
}

class _SignUpAndLoginScreenState extends State<SignUpAndLoginScreen> {
  LoginAndSignUpBloc? _bloc;

  @override
  void initState() {
    _bloc = LoginAndSignUpBloc()..add(InitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc!,
      child: Scaffold(
        backgroundColor: AppColor.white,
        body: BlocConsumer<LoginAndSignUpBloc, LoginAndSignUpState>(
          listener: (BuildContext context, LoginAndSignUpState state) {},
          builder: (BuildContext context, LoginAndSignUpState state) =>
              _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBar(),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 29, right: 29),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTopIcon(imageUrl: ImageConstant.google_icon),
                      _buildTopIcon(imageUrl: ImageConstant.apple_icon),
                      SizedBox(
                          height: 35,
                          width: 35,
                          child: _buildTopIcon(
                              imageUrl: ImageConstant.facebook_icon)),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Center(child: _buildSubText()),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildSubText(){
    return TextWidget(text: 'Or use your email account to login', textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColor.grey.withOpacity(0.6)));
  }

  Widget _buildTopIcon({String? imageUrl}) {
    return SizedBox(
      height: 50,
      width: 50,
      child: Image.asset(
        imageUrl!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.blackBkColor))),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top + 10,
            color: AppColor.white,
          ),
          Container(
            height: kToolbarHeight - 20,
            color: AppColor.white,
            child: const TextWidget(
              text: 'Login',
              textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: AppColor.blackBkColor),
            ),
          )
        ],
      ),
    );
  }
}
