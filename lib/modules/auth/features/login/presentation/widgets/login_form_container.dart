// import 'package:q_bank/common/common.dart';
// import 'package:q_bank/core/core.dart';
// import 'package:q_bank/modules/auth/auth.dart';
// import 'package:flutter/material.dart';

// class LoginFormContainer extends StatelessWidget {
//   final GlobalKey<FormState> globalKey;
//   final TextEditingController emailController;
//   final TextEditingController passwordController;
//   const LoginFormContainer({
//     required this.emailController,
//     required this.passwordController,
//     required this.globalKey,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ParentPaddingWidget(
//       hasSafeArea: false,
//       left: AppSpacing.xlg.r,
//       bottom: 0,
//       top: 0,
//       child: AutofillGroup(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             ParentTextWidget(
//               "Welcome back!",
//               style: context.textTheme.headlineSmall?.copyWith(
//                 color: context.customTheme.textPrimary,
//                 fontWeight: AppFontWeight.black,
//               ),
//               textAlign: .center,
//             ),
//             AppGaps.gapH8,
//             ParentTextWidget(
//               "Log in to your Dress Nepal account and continue shopping.",
//               style: context.textTheme.bodyMedium?.copyWith(
//                 color: context.customTheme.textSecondary,
//                 fontWeight: AppFontWeight.medium,
//               ),
//               textAlign: .center,
//             ),
//             AppGaps.gapH16,
//             LoginForm(
//               formKey: globalKey,
//               emailController: emailController,
//               passwordController: passwordController,
//             ),
//             AppGaps.gapH8,
//             RememberForgetPasswordWidget(),
//             AppGaps.gapH16,
//             LoginButtonWidget(
//               formKey: globalKey,
//               emailController: emailController,
//               passwordController: passwordController,
//             ),
//             AppGaps.gapH16,
//             LoginSeperator(),
//             AppGaps.gapH16,
//             ThirdPartyLoginView(),
//             AppGaps.gapH16,
//             LoginSignupInfoWidget(),
//           ],
//         ),
//       ),
//     );
//   }
// }
