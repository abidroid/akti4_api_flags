import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        title: Text('Countries List'),
      ),
      body: SizedBox(
        height: 120,
        width: double.infinity,
        child: Card(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              spacing: 10,
              children: [
                CircleAvatar(
                  radius: 50,
                  // backgroundColor: Colors.amber,
                  //backgroundImage: SvgPicture()

                  // SvgPicture.network(
                  //         'https://upload.wikimedia.org/wikipedia/commons/3/36/Flag_of_Albania.svg')
                  //     as ImageProvider,
                ),
                // Container(
                //   width: 100,
                //   height: 80,
                //   color: Colors.amber,
                //
                // ),
                Text(
                  "Pakistan",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
