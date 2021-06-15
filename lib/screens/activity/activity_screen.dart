import 'package:clubmate/screens/activity/your_activity_list_screen.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: YourActivityListScreen(),
    );
  }
}
