import 'package:flutter/material.dart';
import 'package:q_bank/common/widgets/parent_pading_widget.dart';
import 'package:q_bank/common/widgets/textfield/textfield.dart';
import 'package:q_bank/core/utils/utils.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ParentPaddingWidget(
      top: 0,
      child: CustomOutlinedTextField(
        hint: "Search Exams",
        borderRadius: 20.r,
        prefixIcon: Icon(Icons.search_rounded),
        readOnly: true,
        textInputAction: .search,

        //
      ),
    );
  }
}
