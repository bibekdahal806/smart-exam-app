import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';

class CustomPaginatedListView extends StatelessWidget {
  const CustomPaginatedListView({
    required this.data,
    required this.itemBuilder,
    super.key,
    required this.pagination,
    required this.scrollController,
    this.separator = const SizedBox.shrink(),
    this.separatorHeight,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.shrinkWrap = false,
  });
  final List<dynamic> data;
  final IndexedWidgetBuilder itemBuilder;
  final PaginationModel pagination;
  final ScrollController scrollController;
  final Widget separator;
  final double? separatorHeight;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: shrinkWrap,
      physics: physics,
      controller: scrollController,
      separatorBuilder: (context, index) {
        return separatorHeight == null
            ? separator
            : SizedBox(height: separatorHeight);
      },
      itemCount: data.length + 1,
      itemBuilder: (context, index) {
        if (index == data.length) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: pagination.next == ""
                  ? const Text("")
                  : const CircularProgressIndicator(strokeWidth: 5),
            ),
          );
        } else {
          return itemBuilder(context, index);
        }
      },
    );
  }
}
