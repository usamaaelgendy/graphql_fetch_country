import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_fetch_country/core/services/dependency_injection_services.dart';
import 'package:graphql_fetch_country/core/utils/utils.dart';
import 'package:graphql_fetch_country/countries/domain/entities/country.dart';
import 'package:graphql_fetch_country/countries/presentation/controller/countries_bloc.dart';
import 'package:graphql_fetch_country/countries/presentation/utils/utils.dart';

class SelectCountryScreen extends StatelessWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          sl<CountriesBloc>()..add(GetAllCountryEvent()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text("Country Directory"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              BlocBuilder<CountriesBloc, CountriesState>(
                  builder: (context, state) {
                switch (state.getAllCountryState) {
                  case RequestState.loading:

                    /// TODO : MAKE CUSTOM PROGRESS INDICATOR
                    return const Center(child: CircularProgressIndicator());
                  case RequestState.loaded:
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: DropdownButtonFormField<Country>(
                        decoration: const InputDecoration(
                          labelText: "Choose Country",
                          border: OutlineInputBorder(),
                        ),
                        items: countryDropDownItem(state.countriesList),
                        value: state.selectedCountry,
                        onChanged: (Country? country) {
                          context
                              .read<CountriesBloc>()
                              .add(ChangeSelectedCountryEvent(country!));
                        },
                      ),
                    );
                  case RequestState.error:
                    return Text(
                      state.errorMessage,

                      /// Make Custom Text With theme data
                      style: const TextStyle(color: Colors.red),
                    );
                }
              }),

              /// TODO : Add From AppSize DON'T add ant hard Coded
              const SizedBox(height: 20),
              BlocBuilder<CountriesBloc, CountriesState>(
                  buildWhen: (previous, current) =>
                      previous.countryDetailsState !=
                      current.countryDetailsState,
                  builder: (context, state) {
                    switch (state.countryDetailsState) {
                      case RequestState.loading:
                        return const Center(child: CircularProgressIndicator());
                      case RequestState.loaded:
                        if (state.selectedCountry != null) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Country Info",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Card(
                                color: Colors.grey.shade50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text("Name"),
                                          Text("Capital"),
                                          Text("Country code"),
                                          Text("Native"),
                                          Text("Currency"),
                                          Text("Phone Code"),
                                          Text("Emoji"),
                                        ],
                                      ),
                                      const Spacer(flex: 3),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              ": ${state.countryDetails?.name}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              ": ${state.countryDetails?.capital ?? ''}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              ": ${state.countryDetails?.code ?? ''}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              ": ${state.countryDetails?.native ?? ''}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              ": ${state.countryDetails?.currency ?? ''}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              ": ${state.countryDetails?.phone ?? ''}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              ": ${state.countryDetails?.emoji ?? ''}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ],
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return const SizedBox.shrink();
                      case RequestState.error:
                        return Text(
                          state.errorMessage,

                          /// Make Custom Text With theme data
                          style: const TextStyle(color: Colors.red),
                        );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
