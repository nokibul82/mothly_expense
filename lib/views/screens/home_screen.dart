import 'package:flutter/material.dart';
import './expense_screen.dart';
import './report_screen.dart';
import '../../core/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var index;
  final screens = [const ExpenseScreen(), const ReportScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index ?? 0],
      bottomNavigationBar: BottomNavigationBarTheme(
          data: const BottomNavigationBarThemeData(
              elevation: 0,
              selectedLabelStyle: TextStyle(color: AppColor.secondary)),
          child: NavigationBar(
            indicatorColor: AppColor.secondary,
            backgroundColor: AppColor.background,
            selectedIndex: index ?? 0,
            onDestinationSelected: (value) {
              setState(() {
                index = value;
              });
            },
            destinations: const [
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home,
                  ),
                  icon: Icon(Icons.home),
                  label: "Expense"),
              NavigationDestination(
                  selectedIcon: Icon(
                    Icons.bar_chart,
                  ),
                  icon: Icon(Icons.bar_chart),
                  label: "Report"),
            ],
          )),
    );
  }
}
