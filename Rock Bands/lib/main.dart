import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(RockBandApp());
}

class RockBandApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bandas de Rock',
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BandsScreen(),
        '/band_details': (context) => BandDetailsScreen(),
      },
    );
  }
}

class Band {
  final String name;
  final int yearFormed;
  final int albumsSold;
  final List<String> members;

  Band({
    required this.name,
    required this.yearFormed,
    required this.albumsSold,
    required this.members,
  });
}

class BandsScreen extends StatelessWidget {
  final List<Band> bands = [
    Band(
      name: 'Led Zeppelin',
      yearFormed: 1968,
      albumsSold: 300000000,
      members: ['Robert Plant', 'Jimmy Page', 'John Paul Jones', 'John Bonham'],
    ),
    Band(
      name: 'The Beatles',
      yearFormed: 1960,
      albumsSold: 600000000,
      members: ['John Lennon', 'Paul McCartney', 'George Harrison', 'Ringo Starr'],
    ),
    Band(
      name: 'Queen',
      yearFormed: 1970,
      albumsSold: 300000000,
      members: ['Freddie Mercury', 'Brian May', 'Roger Taylor', 'John Deacon'],
    ),
    Band(
      name: 'Rolling Stones',
      yearFormed: 1962,
      albumsSold: 250000000,
      members: ['Mick Jagger', 'Keith Richards', 'Charlie Watts', 'Ronnie Wood'],
    ),
    Band(
      name: 'Pink Floyd',
      yearFormed: 1965,
      albumsSold: 250000000,
      members: ['David Gilmour', 'Roger Waters', 'Richard Wright', 'Nick Mason'],
    ),
    Band(
      name: 'AC/DC',
      yearFormed: 1973,
      albumsSold: 200000000,
      members: ['Angus Young', 'Brian Johnson', 'Malcolm Young', 'Cliff Williams'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bandas de Rock'),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                bands[index].name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/band_details', arguments: bands[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

class BandDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Band band = ModalRoute.of(context)!.settings.arguments as Band;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhes da Banda',
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Nome: ${band.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Ano de criação: ${band.yearFormed}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Discos vendidos: ${band.albumsSold}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Text(
              'Integrantes:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: band.members.map((member) {
                return Text(
                  member,
                  style: TextStyle(fontSize: 18),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
