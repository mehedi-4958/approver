import 'package:approver/screens/login_screen.dart';
import 'package:approver/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('PROFILE'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 70,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue[100], fixedSize: Size(200, 30)),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Center(
                                  child: Text(
                                    'Change Password',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                content: Container(
                                  height: 250,
                                  child: Form(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Old Password',
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              '*',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              'New Password',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '*',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              'Re-enter New Password',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '*',
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                  ),
                                                ),
                                                child: TextButton(
                                                  child: Text(
                                                    'Save',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Expanded(
                                              child: Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                  ),
                                                ),
                                                child: TextButton(
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ProfilePage()));
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Change Password',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.only(left: 50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 30,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 30),
                          Text(
                            auth.user.name,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Icon(
                            Icons.email,
                            size: 30,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 30),
                          Text(
                            auth.user.email,
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                        auth.user.name != null ? auth.user.name : 'guest user',
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
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
    );
  }
}
