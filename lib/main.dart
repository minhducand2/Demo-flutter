import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
      title: "Weather App",
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second': (context) => Home(),
        '/third': (context) => Home2(),
      },
      // home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"), fit: BoxFit.cover)),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new RaisedButton(
            child: new Text("View information about Minh Duc"),
            color: Colors.blueAccent[600],
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          new RaisedButton(
            child: new Text("Minh Duc's house now"),
            color: Colors.blueAccent[600],
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
          ),

        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  Future getWheather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=Hanoi,vn&appid=0b02ee1c6dd9dafd7a2a8a0780323cc2");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWheather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Phạm Văn Minh Đức hiện tại:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Đã có người yêu... :)))",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600)),
                ),

              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title: Text("Chiều cao:"),
                  trailing: Text("không thích nói"),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  title: Text("Có tính tình thất thường không:"),
                  trailing: Text("không"),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.water),
                  title: Text("Sở thích:"),
                  trailing: Text("không thích gì"),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.wind),
                  title: Text("Thích đi phượt không:"),
                  trailing: Text("Ờ thì có :))"),
                ),
                Center(
                  child: new RaisedButton(
                    child: new Text("Home page"),
                    color: Colors.blueAccent[600],
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class Home2 extends StatefulWidget {
  Home2({Key key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  Future getWheather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=Turan&appid=0b02ee1c6dd9dafd7a2a8a0780323cc2");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWheather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Nhà hiện tại:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("1111 GỐC PHỐ ĐÀ NẴNG",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600)),
                ),
                Center(
                  child: new RaisedButton(
                    child: new Text("Home page"),
                    color: Colors.blueAccent[600],
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ),

              ],
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[

              ],
            ),
          ))
        ],
      ),
    );
  }
}
