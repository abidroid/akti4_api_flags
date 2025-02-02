import 'package:akti4_api_flags/models/country_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryDetailScreen extends StatelessWidget {
  const CountryDetailScreen({
    super.key,
    required this.countryModel,
  });

  final CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          title: Text(countryModel.name!),
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: SvgPicture.network(countryModel.flag!, fit: BoxFit.cover,),
            ),
            Text(
              countryModel.name!,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              countryModel.iso2!,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              countryModel.iso3!,
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ));
  }
}
