class QueryOptionsSelection {
  static const countryQuery = r'''
query {
  countries{
    code
    name
  }
}
''';

  static const countryDetailsQuery = r'''
query getCountry($code:ID!){
  country(code:$code){
    name
    capital
    code
    native
    currency
    phone
    emoji
  }
}
''';
}
