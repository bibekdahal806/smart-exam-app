import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class RememberForgetPasswordWidget extends StatelessWidget {
  const RememberForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox.square(
                dimension: AppSpacing.xlg,
                child: BlocSelector<LoginBloc, LoginState, bool>(
                  selector: (state) {
                    return state.isRememberMe;
                  },
                  builder: (context, isRememberMe) {
                    return Checkbox(
                      value: isRememberMe,
                      onChanged: (val) {
                        if (val != null) {
                          context.read<LoginBloc>().add(
                            LoginRememberMeToggled(),
                          );
                        }
                      },
                      tristate: false,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    );
                  },
                ),
              ),
              AppGaps.gapW12,
              ParentTextWidget(
                "Remember me",
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: AppFontWeight.medium,
                ),
              ),
            ],
          ),
        ),
        CustomButton.text(
          label: "Forget Password?",
          onTap: () {
            context.pushNamed(Routes.forgetPassword.name);
          },
          padding: EdgeInsets.fromLTRB(
            AppSpacing.md.r,
            AppSpacing.lg.r,
            AppSpacing.sm.r,
            AppSpacing.md.r,
          ),
          textColor: context.colorScheme.primary,
        ),
      ],
    );
  }
}
