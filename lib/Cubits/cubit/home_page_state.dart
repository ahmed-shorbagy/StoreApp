part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageFaliure extends HomePageState {}

class HomePageSuccess extends HomePageState {
  List<ProducteModel> products;
  HomePageSuccess({required this.products});
}

class HomePagLoading extends HomePageState {}
