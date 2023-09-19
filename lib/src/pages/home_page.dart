import 'package:cf_qr_scanner/src/pages/address_page.dart';
import 'package:cf_qr_scanner/src/pages/map_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('QR Scanner'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever)),
        ],
      ),
      body: _callPage(_currentIndex),
      bottomNavigationBar: _createBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () {_scanQR();},
        backgroundColor: Theme.of(context).primaryColor,

      ),
    );
  }

  Widget _createBottomNavigationBar() {

    return BottomNavigationBar(
      fixedColor: Theme.of(context).primaryColor,
      currentIndex: _currentIndex,
      onTap: ( index ) { setState(() {
        _currentIndex = index;
      });},
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          label: 'Direcciones'
        ),
      ],
    );

  }

  Widget _callPage( int currentPage) {

    switch ( currentPage ) {

      case 0 : return MapPage();
      case 1 : return AddressPage();
      default: return MapPage();

    }

  }

  void _scanQR() {
    print('scan');
  }
}
