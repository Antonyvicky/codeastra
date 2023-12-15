import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soil Tester',
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF2196F3, <int, Color>{
          50: Colors.blue,
          100: Colors.blue,
          200: Colors.blue,
          300: Colors.blue,
          400: Colors.blue,
          500: Colors.blue,
          600: Colors.blue,
          700: Colors.blue,
          800: Colors.blue,
          900: Colors.blue
        }),
      ),
      home: HomePage_1(),
    );
  }
}

class DrawerItem {
  final String title;
  final IconData icon;
  final Widget page;

  DrawerItem({required this.title, required this.icon, required this.page});
}

// ignore: camel_case_types
class HomePage_1 extends StatelessWidget {
  final List<DrawerItem> drawerItems = [
    DrawerItem(title: 'Profile', icon: Icons.person, page: const ProfilePage()),
    DrawerItem(
        title: 'About', icon: Icons.info, page: const AboutDetailsPage()),
    DrawerItem(
        title: 'Source', icon: Icons.code, page: const SourceDetailsPage()),
  ];

  HomePage_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 70.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            for (var item in drawerItems)
              ListTile(
                title: Text(item.title),
                leading: Icon(item.icon),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => item.page,
                    ),
                  );
                },
              ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Hero(
          tag: 'appBarTitle',
          child: Text(
            'Soil Tester Home',
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag: 'appBarIcon',
            child: Image.asset(
              'assets/images/lo.png',
              fit: BoxFit.cover,
              height: 40,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    width: 2.0,
                    color: Colors.transparent,
                  ),
                ),
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromARGB(129, 255, 255, 255).withOpacity(0.5),
                      const Color.fromARGB(124, 255, 255, 255).withOpacity(0.5),
                    ],
                  ),
                ),
                child: const Center(
                  child: Text(
                    '"Farmers transform soil into life\'s canvas, painted with dedication, resilience, and bountiful harvests."',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'RobotoSerif',
                      color: Color.fromARGB(255, 11, 11, 11),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Data",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Device",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 16, 129, 182),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage_1(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ElementsPage(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SourceDetailsPage(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutDetailsPage(),
                ),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeDetailsPage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

// ignore: camel_case_types
class onPressed {
  const onPressed(MaterialPageRoute materialPageRoute);
}

class ResponsiveBoxListPage extends StatelessWidget {
  const ResponsiveBoxListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElementsPage();
  }
}

class ElementsPage extends StatelessWidget {
  final List<String> boxData = List.generate(18, (index) => 'Box ${index + 1}');

  ElementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Elements Page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: ListView.builder(
                itemCount: boxData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(boxData[index]),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                              0,
                              3,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(8),
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 156, 219, 250),
                                  shape: BoxShape.circle,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.cloud,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                boxData[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Material(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailPage(boxData[index]),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.blue,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'View Details',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Data",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 16, 129, 182),
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage_1(),
                ),
              );
              break;
            case 1:
              // You are already on the ElementsPage, no need to navigate again.
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SourceDetailsPage(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutDetailsPage(),
                ),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeDetailsPage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String boxText;

  const DetailPage(this.boxText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 74, 157, 195),
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Text(
          'You tapped on $boxText',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class HomeDetailsPage extends StatefulWidget {
  const HomeDetailsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeDetailsPageState createState() => _HomeDetailsPageState();
}

class _HomeDetailsPageState extends State<HomeDetailsPage> {
  int colorIndex = 0;
  late List<Color> themeColors;

  @override
  void initState() {
    super.initState();
    themeColors = [
      Colors.white,
      Colors.green,
      Colors.orange,
      Colors.blue,
    ];
  }

  void _changeTheme() {
    setState(() {
      colorIndex = (colorIndex + 1) % themeColors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColors[colorIndex],
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: const Text('Account'),
              subtitle: const Text('Manage your account settings'),
              leading: const Icon(Icons.account_circle),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
            const ListTile(
              title: Text('Notifications'),
              subtitle: Text('Configure app notifications'),
              leading: Icon(Icons.notifications),
            ),
            ListTile(
              title: const Text('Change Theme'),
              subtitle: const Text('Change the app theme color'),
              leading: const Icon(Icons.color_lens),
              onTap: _changeTheme,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Data",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Device",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 16, 129, 182),
        unselectedItemColor: Colors.grey,
        currentIndex: 4,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage_1(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ElementsPage(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SourceDetailsPage(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutDetailsPage(),
                ),
              );
              break;
            case 4:
              // You are already on the AboutDetailsPage, no need to navigate again.
              break;
          }
        },
      ),
    );
  }
}

// ignore: unused_element
void _changeTheme(BuildContext context) {
  _HomeDetailsPageState pageState =
      context.findAncestorStateOfType<_HomeDetailsPageState>()!;
  pageState._changeTheme();
}

class AboutDetailsPage extends StatelessWidget {
  const AboutDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'About Details',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Search here.',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Handle search action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Data",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 16, 129, 182),
        unselectedItemColor: Colors.grey,
        currentIndex: 3,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage_1(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ElementsPage(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SourceDetailsPage(),
                ),
              );
              break;
            case 3:
              // You are already on the SourceDetailsPage, no need to navigate again.
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeDetailsPage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

class SourceDetailsPage extends StatefulWidget {
  const SourceDetailsPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SourceDetailsPageState createState() => _SourceDetailsPageState();
}

class _SourceDetailsPageState extends State<SourceDetailsPage> {
  final List<String> devices = [];

  TextEditingController deviceNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Add Device',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: deviceNameController,
              decoration: const InputDecoration(
                labelText: 'Device Name',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (deviceNameController.text.isNotEmpty) {
                  setState(() {
                    devices.add(deviceNameController.text);
                    deviceNameController.clear();
                  });
                }
              },
              child: const Text('Add Device'),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: devices.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(devices[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            devices.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Data",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add Device",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.find_in_page),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 16, 129, 182),
        unselectedItemColor: const Color.fromARGB(255, 132, 143, 148),
        currentIndex: 2, // Set the initial index here
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage_1(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ElementsPage(),
                ),
              );
              break;
            case 2:
              // You are already on the SourceDetailsPage, no need to navigate again.
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutDetailsPage(),
                ),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeDetailsPage(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}

class AddDevicePage extends StatefulWidget {
  const AddDevicePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddDevicePageState createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  final TextEditingController _deviceNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Set background color for the add device page
      appBar: AppBar(
        title: const Text(
          'Add Device',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _deviceNameController,
              decoration: const InputDecoration(
                labelText: 'Device Name',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String deviceName = _deviceNameController.text;
                // ignore: avoid_print
                print('Added device: $deviceName');
                Navigator.pop(context);
              },
              child: const Text('Add Device'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: const Color.fromARGB(
                255, 16, 129, 182), // Change the color as needed
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/profile.png'), // Replace with your image asset
                  ),
                  SizedBox(height: 10),
                  Text(
                    'John Doe', // Replace with the actual username
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          buildProfileRow(Icons.person, 'Username', 'john_doe123'),
          buildProfileRow(Icons.email, 'Email', 'john.doe@example.com'),
          buildProfileRow(Icons.lock, 'Password', '********'),
        ],
      ),
    );
  }

  Widget buildProfileRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ... (previous imports)

