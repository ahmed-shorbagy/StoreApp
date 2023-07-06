import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/Producte_model.dart';
import '../../services/GetALLProducts.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  void getTheProducts() async {
    emit(HomePagLoading());
    try {
      await GetAllProductService().getAllProducts();
      List<ProducteModel> products =
          await GetAllProductService().getAllProducts();
      emit(HomePageSuccess(products: products));
    } catch (e) {
      emit(HomePageFaliure());
    }
  }
}
