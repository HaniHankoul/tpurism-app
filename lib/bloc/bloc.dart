// Define the navigation states
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavItem { home, profile, book,reviews }

class NavigationCubit extends Cubit<NavItem> {
  NavigationCubit() : super(NavItem.home); // Default to home
  void navigateTo(NavItem item) {
    emit(item);
  }
}