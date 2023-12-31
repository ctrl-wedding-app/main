import 'package:flutter/material.dart';
import 'package:whistlingwoodz/utils/app_utils.dart';
import 'package:whistlingwoodz/main.dart';

// This class for the Bottom Navigation Bar widget
class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  // The function of the bottom navigation bar to navigate to each tab
  // Future<void> navigationTapped(int index) async {
  navigationTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
    // if (_selectedIndex == 0) {
    //   return  MyApp(selectedIndex: _selectedIndex);
    //   // Navigator.push(
    //   //     context, MaterialPageRoute(builder: (context) => const Wedding(data: false)));
    //   // ScaffoldMessenger.of(context)
    //   //   ..removeCurrentSnackBar()
    //   //   ..showSnackBar(SnackBar(content: Text('$result')));
    // } else if (_selectedIndex == 1) {
    //   // debugPrint(_selectedIndex.toString());
    //   return MyApp(selectedIndex: _selectedIndex);
    // } else if (_selectedIndex == 2) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const Party(),));

    // } else if (_selectedIndex == 3) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const Services()));
    // } else if (_selectedIndex == 4) {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => const MatchMaking()));
    // } else {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => const Galleries()));
    // }
    runApp(MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Whistlingwoodz',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyApp(selectedIndex: _selectedIndex),
    ));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 6,
      vsync: this,
    );
    _tabController.addListener(
      () => setState(() => _selectedIndex = _tabController.index),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TabBar(
        controller: _tabController,
        labelColor: bottomNavigationColor,
        tabs: const [
          // Wedding tab
          Tab(
            icon: Icon(
              Icons.people_outlined,
            ),
            text: "W",
          ),
          // Corporate tab
          Tab(
            icon: Icon(
              Icons.add_business_outlined,
            ),
            text: "C",
          ),
          // Party tab
          Tab(
            icon: Icon(
              Icons.wine_bar_outlined,
            ),
            text: "P",
          ),
          // Service tab
          Tab(
            icon: Icon(
              Icons.room_service_outlined,
            ),
            text: "S",
          ),
          // Match Making tab
          Tab(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            text: "M",
          ),
          // Gallery tab
          Tab(
            icon: Icon(
              Icons.party_mode_outlined,
            ),
            text: "G",
          ),
        ],
        // event for the bottom navigation bar
        onTap: navigationTapped,
      ),
    );
  }
}
