import 'package:approver/models/data.dart';
import 'package:approver/screens/login_screen.dart';
import 'package:approver/services/auth.dart';
import 'package:approver/services/itemlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:approver/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Auth auth = Auth();
  ItemList pending = ItemList();
  late List<ItemDetail> items;
  var len;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    ItemList().itemList();
    items = pending.itemdetail;
    len = pending.itemdetail.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            //toolbarHeight
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('Pending'),
                ),
                Tab(
                  child: Text('Approved'),
                ),
                Tab(
                  child: Text('Declined'),
                ),
              ],
            ),
            title: Text('ITEM LIST'),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              Container(
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.blue[100],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: len),
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
          drawer: Drawer(
            child: Container(
              color: Colors.blue,
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 100,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          auth.user!.name != null
                              ? auth.user!.name
                              : 'guest user',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Profile'),
                    leading: Icon(Icons.auto_awesome_mosaic),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                  ),
                  ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout),
                    onTap: () {
                      Provider.of<Auth>(context, listen: false).logout();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
