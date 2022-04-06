import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intership_onix/ui/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_intership_onix/ui/screens/converter_screen.dart';
import 'package:flutter_intership_onix/ui/screens/currencies_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  //List of screens for bottom navigation bar
  final List<Widget> _screenList = [
    const ConverterScreen(),
    const CurrenciesScreen(),
  ];

  //List of icons for bottom navigation bar
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/converter.svg',
        height: 25,
        color: Colors.black54,
      ),
      activeIcon: SvgPicture.asset(
        'assets/icons/converter.svg',
        height: 30,
        color: const Color(0xff4D3DAD),
      ),
      label: 'Converter',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/icons/currencies.svg',
        height: 25,
        color: Colors.black54,
      ),
      activeIcon: SvgPicture.asset(
        'assets/icons/currencies.svg',
        height: 30,
        color: const Color(0xff4D3DAD),
      ),
      label: 'Currencies',
    ),
  ];

  //change index on bottom navigation bar.
  void changeIndex(int _newIndex) {
    setState(() {
      _selectedIndex = _newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: ElevatedButton(
        //   onPressed: () {
        //     BlocProvider.of<ThemeBloc>(context).add(ChangeTheme());
        //   },
        //   child: Text('Change'),
        // ),
        child: _screenList[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        items: _items,
        currentIndex: _selectedIndex,
        onTap: changeIndex,
      ),
    );
  }
}
