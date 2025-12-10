part of 'package_info_cubit.dart';

class PackageInfoState extends Equatable {
  final PackageInfo? packageInfo;

  const PackageInfoState({this.packageInfo});

  @override
  List<Object?> get props => [packageInfo];

  PackageInfoState copyWith({PackageInfo? packageInfo}) {
    return PackageInfoState(
      packageInfo: packageInfo ?? this.packageInfo,
    );
  }
}
