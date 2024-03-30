import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reserve_state.dart';

class ReserveCubit extends Cubit<ReserveState> {
  ReserveCubit() : super(const ReserveState());

  void init(){
    emit(const ReserveState());
  }

  changeReservationId(String value) {
    emit(state.copyWith(id: value));
  }

  void changePickupDate(DateTime val) {
    emit(state.copyWith(pickupDate: val));
  }

  void changeReturnDate(DateTime val) {
    emit(state.copyWith(returnDate: val));
  }

  changeDiscount(String value) {
    emit(state.copyWith(discount: int.tryParse(value)));
  }
}
