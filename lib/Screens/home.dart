import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/Screens/Search.dart';

import 'package:quran_app/widget/CustomHeadText.dart';
import 'package:quran_app/widget/CustomParts.dart';
import 'package:quran_app/widget/customListView.dart';

class SourasView extends StatefulWidget {
  SourasView({super.key});

  @override
  State<SourasView> createState() => _SourasViewState();
}

class _SourasViewState extends State<SourasView> {
  int barSelectedIndex = 0;
  var icons = [
    Icons.home,
    Icons.search,
  ];
  List<Map<String, dynamic>> BottomBarscreens = [
    {'screen': SourasView(), 'title': 'القران الكريم'},
    {'screen': SearchScreen(), 'title': 'البحث'},
  ];
  int selectedIndex = 0;
  List<Map<String, dynamic>> Drawerscreens = [
    {'screen': CustomPartsListView(), 'title': 'الاجزاء'},
    {'screen': const CustomListView(), 'title': 'السور'},
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomHeadText(
            text: BottomBarscreens[barSelectedIndex]['title'],
            Textsize: 18,
            fontweight: FontWeight.bold,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SearchScreen(),
                      ));
                },
                icon: Icon(Icons.search))
          ],
          leading: TextButton(
            child: CustomHeadText(
              text: "اليوم",
              Textsize: 15,
            ),
            onPressed: () {},
          ),
          backgroundColor: Color.fromARGB(255, 8, 92, 6),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 8, 92, 6),
                ),
                child: Text('الفهرس'),
              ),
              ListTile(
                title: const Text('الاجزاء'),
                selected: selectedIndex == 0,
                onTap: () {
                  _onItemTapped(0);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('السور'),
                selected: selectedIndex == 1,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(1);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          onTap: (value) {
            setState(() {
              barSelectedIndex = value;
            });
          },
          activeIndex: barSelectedIndex,
          itemCount: icons.length,
          tabBuilder: (index, isActive) {
            return Icon(
              icons[index],
              color: isActive ? Color.fromARGB(255, 69, 104, 77) : Colors.black,
            );
          },
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: Drawerscreens[selectedIndex]['screen']),
          ),
        ),
      ),
    );
  }
}
