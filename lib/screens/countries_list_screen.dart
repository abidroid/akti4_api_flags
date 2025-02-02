import 'dart:convert';

import 'package:akti4_api_flags/models/country_model.dart';
import 'package:akti4_api_flags/screens/country_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  Future<List<CountryModel>> getAllCountries() async {
    List<CountryModel> countries = [];

    String endPoint =
        "https://countriesnow.space/api/v0.1/countries/flag/images";
    // make a GET request to the API endpoint using http package
    http.Response response = await http.get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      // our request was successful

      var jsonResponse = jsonDecode(response.body);

      var jsonCountryArray = jsonResponse['data'];

      for (var jsonCountry in jsonCountryArray) {
        CountryModel country = CountryModel.fromJson(jsonCountry);
        countries.add(country);
      }
    }

    return countries;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey
        ,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          title: Text('Countries List'),
        ),
        body: FutureBuilder<List<CountryModel>>(
            future: getAllCountries(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              List<CountryModel> countries = snapshot.data;

              if (snapshot.hasData && snapshot.connectionState != ConnectionState.waiting) {
                return ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index){

                      CountryModel country = countries[index];

                      return SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return CountryDetailScreen(countryModel: country);
                            }));
                          },
                          child: Card(
                            // color: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                spacing: 10,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    height: 80,
                                    child: SvgPicture.network(country.flag!),
                                  ),
                                  Expanded(
                                    child: Text(
                                      country.name!,
                                      style: TextStyle(fontSize: 30, ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                });
              } else {
                return Center(
                  child: SpinKitDualRing(color: Colors.amber),
                );
              }
            }));
  }
}

/*
SizedBox(
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
                ),
                Text(
                  "Pakistan",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
 */
