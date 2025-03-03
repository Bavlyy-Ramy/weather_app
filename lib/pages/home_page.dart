import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/initial_body.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/success_body.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherSuccess) {
          return SuccessBody(weatherData: state.weatherModel);
        } else if (state is WeatherFailure) {
          return const Center(child:  Text("something went wrong... try again"));
        } else {
          return const Center(
            child: InitialBody(),
          );
        }
      }),
    );
  }
}
