// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:modul3prak/app/routes/app_routes.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPageIndex = 0;
  void navigateToPage(int index) {
    switch (index) {
      case 0:
        // Navigate to the first page
        Get.toNamed(RoutesClass.getHomeRoute());
        break;
      case 1:
        // Navigate to the second page
        // Get.toNamed(RoutesClass.getFavoriteRoute());
        break;
      case 2:
        // Navigate to the third page
        // Get.toNamed(RoutesClass.getCatchingPokemonRoute());
        break;
      case 3:
        // Navigate to the fourth page
        // Get.toNamed(RoutesClass.getAttachMoneyRoute());
        break;
      case 4:
        // Navigate to the fifth page
        Get.toNamed(RoutesClass.getAccountRoute());
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 56, 56, 56),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 310,
                    height: 60,
                    child: Card(
                      color: Colors.white10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28.0)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.yellow,
                              size: 21,
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Text(
                              'Cari menu atau kucing..',
                              style: TextStyle(
                                color: const Color.fromARGB(132, 255, 255, 0),
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Card(
                      color: Colors.yellowAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Sambut hangat aroma kopi dan seruan manis kucing kami pagi ini',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Text(
                        'Fakta random hari ini: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(RoutesClass.getFactsRoute()),
                        child: Text(
                          'Cek Sekarang!!',
                          style: TextStyle(color: Colors.amber, fontSize: 14),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(RoutesClass.getInstagramRoute()),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 100,
                  height: 30,
                  child: Card(
                    child: Text('Webview'),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(RoutesClass.getInstagramRoute()),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 100,
                  height: 30,
                  child: Card(
                    child: Text('API IG'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          navigateToPage(index);
        },
        indicatorColor: Color.fromARGB(255, 248, 244, 27),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.pets),
            icon: Icon(Icons.pets_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.monetization_on),
            icon: Icon(Icons.monetization_on_outlined),
            label: '',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2),
            icon: Icon(Icons.person_2_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
