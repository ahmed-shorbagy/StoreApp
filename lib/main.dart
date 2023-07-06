import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/screens/Update_Product_screen.dart';
import 'package:store_app/screens/home_screen.dart';
import 'Cubits/cubit/home_page_cubit.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomePageCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomePage.id: (context) => HomePage(),
            UpdateProductPage.id: (context) => UpdateProductPage(),
          },
          initialRoute: HomePage.id,
        ));
  }
}
