import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nyntax_car/src/core/utils/constants.dart';

class DateTimePicker extends StatelessWidget {
  final DateTime? selectedDateTime;
  final ValueChanged<DateTime> onChanged;

  const DateTimePicker({
    super.key,
    this.selectedDateTime,
    required this.onChanged,
  });

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      final TimeOfDay? selectedTime = await showTimePicker(
        // ignore: use_build_context_synchronously
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime ?? DateTime.now()),
      );
      if (selectedTime != null) {
        final DateTime combinedDateTime = DateTime(
          picked.year,
          picked.month,
          picked.day,
          selectedTime.hour,
          selectedTime.minute,
        );
        onChanged(combinedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.padding),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: () => _selectDateTime(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  selectedDateTime != null
                      ? "${selectedDateTime?.day}/${selectedDateTime?.month}/${selectedDateTime?.year} ${selectedDateTime?.hour}:${selectedDateTime?.minute}"
                      : "Select Date and Time",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }
}
