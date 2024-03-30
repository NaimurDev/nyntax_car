part of 'reserve_cubit.dart';

class ReserveState extends Equatable {
  final int currentStep = 0;

  // step 0
  final String? id;
  final DateTime? pickupDate;
  final DateTime? returnDate;
  final int? discount;

  // step 1
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  // step 2
  final String? carName;

  // step 3
  final bool? collisionDamageWaiver;
  final bool? liabilityInsurance;
  final bool? rentalTax;

  const ReserveState({
    this.id = "101",
    this.pickupDate,
    this.returnDate,
    this.discount,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.carName,
    this.collisionDamageWaiver,
    this.liabilityInsurance,
    this.rentalTax,
  });

  String get durationText {
    if (pickupDate != null && returnDate != null) {
      final Duration difference = returnDate!.difference(pickupDate!);
      if (difference.inDays >= 7) {
      final weeks = difference.inDays ~/ 7;
      final days = difference.inDays % 7;
      return '$weeks week${weeks > 1 ? 's' : ''} ${days} day${days > 1 ? 's' : ''}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''}';
    } else {
      return '1 hour';
    }
    }
    return "";
  }

  @override
  List<Object?> get props => [
        id,
        pickupDate,
        returnDate,
        discount,
        firstName,
        lastName,
        email,
        phone,
        carName,
        collisionDamageWaiver,
        liabilityInsurance,
        rentalTax,
  ];

  ReserveState copyWith({
    String? id,
    DateTime? pickupDate,
    DateTime? returnDate,
    int? discount,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? carName,
    bool? collisionDamageWaiver,
    bool? liabilityInsurance,
    bool? rentalTax,
  }) {
    return ReserveState(
      id: id ?? this.id,
      pickupDate: pickupDate ?? this.pickupDate,
      returnDate: returnDate ?? this.returnDate,
      discount: discount ?? this.discount,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      carName: carName ?? this.carName,
      collisionDamageWaiver: collisionDamageWaiver ?? this.collisionDamageWaiver,
      liabilityInsurance: liabilityInsurance ?? this.liabilityInsurance,
      rentalTax: rentalTax ?? this.rentalTax,
    );
  }
}
