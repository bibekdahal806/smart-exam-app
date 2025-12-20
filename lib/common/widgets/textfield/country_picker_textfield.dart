import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class CountryPickerTextfield extends StatelessWidget {
  const CountryPickerTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryPickerCubit, Country>(
      builder: (context, state) {
        return Container(
          constraints: BoxConstraints(maxWidth: (context.deviceWidth * 0.25).w),
          child: CustomOutlinedTextField(
            hint: "${state.flagEmoji} +${state.phoneCode}",

            textCapitalization: TextCapitalization.none,
            textInputType: TextInputType.number,
            textInputAction: TextInputAction.next,
            readOnly: true,
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                useSafeArea: true,
                onSelect: (Country country) {
                  context.read<CountryPickerCubit>().change(country);
                },
              );
            },
          ),
        );
      },
    );
  }
}
