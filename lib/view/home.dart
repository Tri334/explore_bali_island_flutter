part of 'landing_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _opsiWidget = [
    HomePage(),
    Text(
      'Soon',
    ),
    Text(
      'Soon',
    ),
    Text(
      'Soon',
    ),
  ];

  void _onItemTapped(int index) {
    setState((() {
      _selectedIndex = index;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: _opsiWidget.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          child: BottomNavigationBar(
            backgroundColor: Colors.red,
            items: const [
              BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(
                    ExploreBaliIsland.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(ExploreBaliIsland.heart), label: 'Fav'),
              BottomNavigationBarItem(
                  icon: Icon(ExploreBaliIsland.discovery), label: 'Discover'),
              BottomNavigationBarItem(
                  icon: Icon(ExploreBaliIsland.profile), label: 'About'),
            ],
            currentIndex: _selectedIndex,
            unselectedItemColor: const Color(0xffABABAB),
            showSelectedLabels: true,
            selectedItemColor: Colors.green,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
