import 'package:flutter/material.dart';
import 'dashboard_layout.dart';
import '/src/screens/dashboard/home_content.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  Widget _currentContent = const HomeContent(); // Default content is Home

  void _setContent(String menu) {
    setState(() {
      if (menu == "Home") {
        _currentContent = const HomeContent();
      } else if (menu == "Employees") {
        _currentContent = const Center(child: Text("Employees Page"));
      } else if (menu == "Jobs") {
        _currentContent = const Center(child: Text("Jobs Page"));
      } else if (menu == "Applicants") {
        _currentContent = const Center(child: Text("Applicants Page"));
      } else if (menu == "Interview") {
        _currentContent = const Center(child: Text("Interview Page"));
      } else if (menu == "Forms") {
        _currentContent = const Center(child: Text("Forms Page"));
      } else if (menu == "Calendar") {
        _currentContent = const Center(child: Text("Calendar Page"));
      } else if (menu == "Lists") {
        _currentContent = const Center(child: Text("Lists Page"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      child: _currentContent,
      onMenuTap: _setContent,
    );
  }
}
