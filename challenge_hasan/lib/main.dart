import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search & Drawer',
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      drawer: _buildDrawer(),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.deepOrangeAccent,
                Colors.orangeAccent,
              ])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Image.asset(
                        'assets/images/Logo.png',
                        width: 180,
                        height: 70,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Icon For Programing',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              )),
          CustemListTile(Icons.person, 'Profile', () => {}),
          CustemListTile(Icons.notifications, 'Notifications', () => {}),
          CustemListTile(Icons.settings, 'Settings', () => {}),
          CustemListTile(Icons.lock, 'Log Out', () => {}),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Search App'),
      backgroundColor: Colors.deepOrange,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            })
      ],
    );
  }
}

class CustemListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustemListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0, 8.0, 15),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[400]))),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Text(
                      text,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final names = [
    'Hasan Rahim',
    'Khalid Mohammed',
    'Salih',
    'Ibraheem',
    'Abdul-Hadi',
    'Malik',
    'Mohammed Al-Sayed',
    'Alaa',
    'Mustafa',
    'Nouf',
    'Kholoud',
    'Aisha Al-Saedi',
  ];

  final recentnames = [
    'Hasan Rahim',
    'Khalid Mohammed',
    'Salih',
    'Ibraheem',
    'Abdul-Hadi',
    'Malik',
    'Mohammed Al-Sayed',
    'Alaa',
    'Mustafa',
    'Nouf',
    'Kholoud',
    'Aisha Al-Saedi',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Action For app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading Icon On left of app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          //* To Show animation
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  // ignore: missing_return
  Widget buildResults(BuildContext context) {
    // show some result based on selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when some search for any thing
    final suggestionList = query.isEmpty
        ? recentnames
        : names.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.people),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.green))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
