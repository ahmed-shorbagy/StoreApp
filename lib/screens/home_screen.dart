import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/Models/Producte_model.dart';
import 'package:store_app/services/GetALLProducts.dart';

import '../Cubits/cubit/home_page_cubit.dart';
import '../component/Custom_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static String id = 'Home page';
  List<ProducteModel> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.black,
                ),
              ))
        ],
      ),
      body: BlocBuilder<HomePageCubit, HomePageState>(
        bloc: BlocProvider.of<HomePageCubit>(context)..getTheProducts(),
        builder: (context, state) {
          if (state is HomePageSuccess) {
            products = state.products;
            return Padding(
              padding: const EdgeInsets.only(top: 65, right: 16, left: 16),
              child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 90,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) => CustomCard(
                  product: products[index],
                ),
              ),
            );
          } else if (state is HomePagLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomePageFaliure) {
            return Center(child: Text('error'));
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }
}
