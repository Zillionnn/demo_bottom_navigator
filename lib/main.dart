import 'package:flutter/material.dart';
import 'screens.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomePage(), routes: {
      '/first': (context) => FirstScreen(),
      '/detail': (context) => DetailScreen(),
    });

    // return new MaterialApp(
    //   // initialRoute: '/',
    //   routes: {
    //     '/': (context)=> HomePage(),
    //     '/second': (context) => DetailScreen(),
    //   }
    // );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  String title = 'firstscreen';
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        iconSize: 24.0,
        fixedColor: Colors.blue,
        onTap: (int index) {
          setState(() {
            this.index = index;
            switch (index) {
              case 0:
                this.title = 'firstscreen';
                break;
              case 1:
                this.title = 'secondscreen';
                break;
              case 2:
                this.title = 'thirdscreen';
                break;
            }
          });
        },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.border_all),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text(''),
          ),
        ],
      ),
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: index != 0,
            child: new TickerMode(
              enabled: index == 0,
              child: new MaterialApp(home: new FirstScreen()),
            ),
          ),
          new Offstage(
            offstage: index != 1,
            child: new TickerMode(
              enabled: index == 1,
              child: new MaterialApp(home: new SecondScreen()),
            ),
          ),
          new Offstage(
            offstage: index != 2,
            child: new TickerMode(
              enabled: index == 2,
              child: new MaterialApp(home: new ThirdScreen()),
            ),
          ),
        ],
      ),
      drawer: Container(
        width: 260.0,
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/lake.jpg',
              height: 100.0,
              fit: BoxFit.cover,
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              onPressed: () {
                print('tapped ');
                Navigator.pushNamed(context, '/detail');
              },
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Saved'),
              ),
              onPressed: () {
                print('tapped ');
              },
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              child: ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Likes'),
              ),
              onPressed: () {
                print('tapped ');
              },
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              child: ListTile(
                leading: Icon(Icons.drafts),
                title: Text('Drafts'),
              ),
              onPressed: () {
                print('tapped ');
              },
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              child: ListTile(
                leading: Icon(Icons.scanner),
                title: Text('Scan QrCode'),
              ),
              onPressed: () {
                print('tapped ');
              },
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              child: ListTile(
                leading: Icon(Icons.history),
                title: Text('History'),
              ),
              onPressed: () {
                print('tapped ');
              },
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              child: ListTile(
                leading: Icon(Icons.theaters),
                title: Text('My topics'),
              ),
              onPressed: () {
                print('tapped ');
              },
            ),
            FlatButton(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              onPressed: () {
                print('tapped ');
              },
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              child: ListTile(
                leading: Icon(Icons.help),
                title: Text('Help & Support'),
              ),
              onPressed: () {
                print('tapped ');
              },
            ),
            FlatButton(
              padding: EdgeInsets.all(0.0),
              child: ListTile(
                leading: Icon(Icons.clear_all),
                title: Text('Clear cache'),
              ),
              onPressed: () {
                print('tapped ');
              },
            ),
            new MergeSemantics(
              child: new ListTile(
                title: new Text('Lights'),
                trailing: new CupertinoSwitch(
                  value: _lights,
                  onChanged: (bool value) {
                    setState(() {
                      _lights = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _lights = !_lights;
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
