import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:heavytransportship/data/dio-helper.dart';
import 'package:heavytransportship/data/shared-preference.dart';

import 'order_state.dart';


class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(OrderInitialStates());
  static OrderCubit get (context)=>BlocProvider.of(context) ;



  String priceOrder = '100'   ;
  getPriceInOrder({required String fromvalue , required String tovalue})
  {
    DioHelper.getDataInOrder(
        path: '/api/price_from_to',
        query:
        {
          'from':fromvalue,
          'to':tovalue ,
        }
    ).then((value)
    {

      priceOrder = CashHelper.getData(key: 'priceOrder') ;
      print(priceOrder)  ;
      print('order data success in cubit') ;
      emit(OrderSuccessInOrder())  ;
    }) ;
  }

  String priceTruck = '100'   ;
  getPriceInTruck({required String fromvalue , required String tovalue})
  {
    DioHelper.getDataInTruck(
        path: '/api/price_from_to',
        query:
        {
          'from':fromvalue,
          'to':tovalue ,
        }
    ).then((value)
    {

      priceTruck = CashHelper.getData(key: 'priceTruck') ;
      print(priceTruck)  ;
      print('order data success in cubit') ;
      emit(OrderSuccessInTruck())  ;
    }) ;
  }


}