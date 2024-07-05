import 'package:bloc_sample_project/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
            builder: (context, state) {
          if (state == InternetState.Gained) {
            return Text('Connected');
          } else if (state == InternetState.Lost) {
            return Text('Not Connected');
          } else {
            return Text("Loading...");
          }
        }, listener: (context, state) {
          if (state == InternetState.Gained) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Internet Connection established"),
              backgroundColor: Colors.green,
            ));
          } else if (state == InternetState.Lost) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Internet Connection Lost'),
              backgroundColor: Colors.red,
            ));
          }
        }),
      ),
    );
  }
}
