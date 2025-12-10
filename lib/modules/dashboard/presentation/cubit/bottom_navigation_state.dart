part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  final int currentIndex;
  const BottomNavigationState({required this.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}
