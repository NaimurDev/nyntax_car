import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyntax_car/src/core/utils/constants.dart';
import 'package:nyntax_car/src/core/widgets/app_button.dart';
import 'package:nyntax_car/src/presentation/reserve/cubit/reserve_cubit.dart';
import 'package:nyntax_car/src/presentation/reserve/widget.dart/date_time_picker.dart';
import 'package:nyntax_car/src/presentation/reserve/widget.dart/mandatory_form_lable.dart';

class ReservationInfoPage extends StatelessWidget {
  const ReservationInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReserveCubit, ReserveState>(builder: (context, state) {
      final cubit = context.read<ReserveCubit>();
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.padding * 2),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: AppSizes.padding * 5),
                        Text(
                          "Reservation Details",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Divider(),
                        const SizedBox(height: AppSizes.padding * 3),
                        Container(
                          padding: const EdgeInsets.all(AppSizes.padding * 2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadius),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const MandatoryFormLabel(
                                text: "Reservation Details",
                              ),
                              const SizedBox(height: AppSizes.padding),
                              TextFormField(
                                initialValue: state.id,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) =>
                                    cubit.changeReservationId(value),
                              ),
                              const SizedBox(height: AppSizes.padding),
                              const MandatoryFormLabel(
                                text: "Pickup Date",
                              ),
                              const SizedBox(height: AppSizes.padding),
                              DateTimePicker(
                                selectedDateTime: state.pickupDate,
                                onChanged: (val) {
                                  cubit.changePickupDate(val);
                                },
                              ),
                              const SizedBox(height: AppSizes.padding),
                              const MandatoryFormLabel(
                                text: "Return Date",
                              ),
                              const SizedBox(height: AppSizes.padding),
                              DateTimePicker(
                                selectedDateTime: state.returnDate,
                                onChanged: (val) {
                                  cubit.changeReturnDate(val);
                                },
                              ),
                              const SizedBox(height: AppSizes.padding),
                              Row(
                                children: [
                                  const Text("Duration"),
                                  const Spacer(),
                                  if (state.durationText.isNotEmpty)
                                    Container(
                                      padding: const EdgeInsets.all(
                                          AppSizes.padding),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text("${state.durationText}"),
                                    ),
                                ],
                              ),
                              const SizedBox(height: AppSizes.padding),
                              const Text("Discount"),
                              const SizedBox(height: AppSizes.padding),
                              TextFormField(
                                // ignore: prefer_null_aware_operators
                                initialValue: state.discount != null
                                    ? state.discount.toString()
                                    : null,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) =>
                                    cubit.changeDiscount(value),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSizes.padding * 2),
                      ],
                    ),
                  ),
                ),
                AppButton(
                  text: "Next",
                  onPressed: () => nextPressed(context),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  nextPressed(BuildContext context) {
    final state = context.read<ReserveCubit>().state;
    if ((state.id?.trim().isEmpty ?? true) ||
        state.pickupDate == null ||
        state.returnDate == null) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please fill all fields."),
      ));
    }else if(state.discount == null){
      
    }else if(state.discount! < 0 || state.discount! > 100){
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Discount should be between 0 and 100."),
      ));
    }

    Navigator.of(context).pushNamed(Routes.customerInfo);
  }
}
