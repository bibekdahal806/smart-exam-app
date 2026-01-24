import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';

class EditProfileFormContainer extends HookWidget {
  const EditProfileFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useRef(GlobalKey<FormState>());

    final user = context.currentUser;

    //initialize controllers directly with user data
    final nameController = useTextEditingController(text: user?.name);
    final emailController = useTextEditingController(text: user?.email);
    final phoneNumberController = useTextEditingController(
      text: PhoneNumberHelper.extractOnlyContactNumber(user?.phone ?? ""),
    );

    useEffect(() {
      if (user?.phone != null) {
        final country = PhoneNumberHelper.getCountryFromPhoneNumber(
          user!.phone!,
        );
        if (country != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<CountryPickerCubit>().change(country);
          });
        }
      }
      return null;
    }, []);

    return Container(
      padding: .all(AppSpacing.baseSpacing.r),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.largeBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .start,
        children: [
          ParentTextWidget(
            'Personal Information',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.customTheme.textPrimary,
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
          AppGaps.gapH4,
          ParentTextWidget(
            'Update your profile information',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.customTheme.icon,
              fontWeight: AppFontWeight.regular,
            ),
          ),
          AppGaps.gapH24,
          EditProfileAvatar(),
          AppGaps.gapH24,
          EditProfileForm(
            formKey: formKey.value,
            phoneNumberController: phoneNumberController,
            emailController: emailController,
            nameController: nameController,
          ),
          AppGaps.gapHCustom(32),
          EditProfileButton(
            formKey: formKey.value,
            nameController: nameController,
            emailController: emailController,
            phoneNumberController: phoneNumberController,
          ),
        ],
      ),
    );
  }
}
