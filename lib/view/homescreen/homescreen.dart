import 'package:api2ndshow/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await Provider.of<Homescreencontroller>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final homescreenstate = Provider.of<Homescreencontroller>(context);
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10),
          child: Text(homescreenstate.resmodel?.data?[index].name ?? ""),
        ),
      ),
    );
  }
}
