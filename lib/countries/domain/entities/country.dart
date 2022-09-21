import 'package:equatable/equatable.dart';

class Country extends Equatable {
  /// Basic information for each country
  final String code;
  final String name;

  /// Sub-information for each country (nullable)
  final String? capital;
  final String? currency;
  final String? native;
  final String? phone;
  final String? emoji;

  /// Country Constructor
  const Country({
    required this.code,
    required this.name,
    this.capital,
    this.currency,
    this.native,
    this.phone,
    this.emoji,
  });

  Country copyWith({
    String? code,
    String? name,
    String? capital,
    String? currency,
    String? native,
    String? phone,
    String? emoji,
  }) {
    return Country(
      code: code ?? this.code,
      name: name ?? this.name,
      capital: capital ?? this.capital,
      currency: currency ?? this.currency,
      native: native ?? this.native,
      phone: phone ?? this.phone,
      emoji: emoji ?? this.emoji,
    );
  }

  /// Properties For Equatable to check values for each variable
  @override
  List<Object?> get props => [
        code,
        name,
        capital,
        currency,
        native,
        phone,
        emoji,
      ];
}
