import 'package:devhacks/model/weather_model.dart';
import 'package:devhacks/services/weather_api_client.dart';
import 'package:devhacks/widgets/current_weather.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async{
    data = await client.getCurrentWeather("mumbai");
  }

  @override
  // void initState(){
  //
  //   super.initState();
  //   client.getCurrentWeather("mumbai");
  // }
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title: Text("Weather",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),


      ),

      // body: Column(
      //
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     const Divider(),
      //     SizedBox(
      //       height: 20.0,
      //     ),
      //     currentWeather(Icons.wb_sunny_rounded, "26.3", "Mumbai"),
      //
      //     SizedBox(
      //       height: 20.0,
      //     ),
      //     Text("Additional Information",
      //       style:
      //       TextStyle(fontSize: 24.0,
      //         color: Colors.black,
      //         fontWeight: FontWeight.bold,
      //       ),
      //
      //     ),
      //     Divider(),
      //
      //
      //   ],
      // ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              const Divider(),
              SizedBox(
                height: 20.0,
              ),
              currentWeather(Icons.wb_sunny_rounded, "${data!.temp}", "${data!.cityName}"),

              SizedBox(
                height: 20.0,
              ),
              Text("Additional Information",
                style:
                TextStyle(fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),

              ),
              Divider(),


            ],
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}





