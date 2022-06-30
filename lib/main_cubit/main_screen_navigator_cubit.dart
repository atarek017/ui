import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../enum/main_tabs.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/settings_screen.dart';

part 'main_screen_navigator_state.dart';

class MainScreenNavigatorCubit extends Cubit<MainScreenNavigatorState> {

  MainScreenNavigatorCubit() : super(MainScreenNavigatorInitial()) {
    pageController = PageController(initialPage: MainTabs.home.index);
  }

  MainTabs currentTab = MainTabs.home;
  PageController? pageController;

  final tabs = [
    HomeScreen(),
    SettingsScreen(),
  ];

  changeTab(int index) {
    currentTab = MainTabs.values.elementAt(index);
    pageController!.jumpToPage(index);
    print(currentTab.name);
    emit(MainNavigationChange(index));
  }
}
