import 'package:flutter/material.dart';
import 'package:weatherapp/screens/homescreen.dart';
import 'package:weatherapp/screens/weekly_weather.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _seletedItem = 0;
  var _pages = [Homescreen(), WeeklyWeather()];
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _seletedItem = index;
          });
        },
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny), label: 'Погода сегодня'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_cloudy), label: 'Погода на 5 дней'),
        ],
        currentIndex: _seletedItem,
        onTap: (index) {
          setState(() {
            _seletedItem = index;
            _pageController.animateToPage(_seletedItem,
                duration: Duration(milliseconds: 200), curve: Curves.linear);
          });
        },
      ),
    );
  }
}
