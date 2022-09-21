import 'package:graphql_fetch_country/countries/domain/entities/country.dart';

/// Extend Entity and using super.
/// This class responsible for any logic
class CountryModel extends Country {
  const CountryModel({
    required super.code,
    required super.name,
    super.capital,
    super.currency,
    super.emoji,
    super.native,
    super.phone,
  });

  /// Using Factory constructor to convert json to object
  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json["code"],
      name: json['name'],
      capital: json["capital"],
      currency: json["currency"],
      emoji: json["emoji"],
      native: json["native"],
      phone: json["phone"],
    );
  }
}
