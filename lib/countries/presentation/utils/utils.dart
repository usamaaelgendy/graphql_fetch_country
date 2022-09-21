import 'package:flutter/material.dart';
import 'package:graphql_fetch_country/countries/domain/entities/country.dart';

List<DropdownMenuItem<Country>> countryDropDownItem(List<Country> countries) {
  return countries
      .map((country) => DropdownMenuItem<Country>(
            value: country,
            child: Text(country.name),
          ))
      .toList();
}
