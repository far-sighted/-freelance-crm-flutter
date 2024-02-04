import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final String label;
  final bool background;
  final DateTime? initialDate;
  final String? Function(String?)? validator;
  final void Function(DateTime?)? onSaved;

  const DatePicker({
    Key? key,
    required this.label,
    this.initialDate,
    this.background = false,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      selectedDate = widget.initialDate!;
      isDateSelected = true;
    }
    if (widget.initialDate != null) {
      controller.text = selectedDate.toString().substring(0, 10);
    } else {

    controller.text = isDateSelected
        ? selectedDate.toString().substring(0, 10)
        : "select a Date";
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.parse("1900-01-01"),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        isDateSelected = true;
        controller.text = selectedDate.toString().substring(0, 10);
      });
      widget.onSaved?.call(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            letterSpacing: 0.5,
            fontSize: 13.0,
          ),
        ),
        const SizedBox(height: 4.0),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            fillColor: widget.background
                ? Theme.of(context).colorScheme.background
                : Theme.of(context).colorScheme.secondaryContainer,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.elliptical(8.0, 8.0)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.elliptical(8.0, 8.0)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.elliptical(8.0, 8.0)),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(8.0, 8.0)),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            filled: true,
            isDense: true,
            hintText: isDateSelected
                ? selectedDate.toString().substring(0, 10)
                : "select a Date",
            prefixIcon: const Icon(Icons.edit_calendar),
          ),
          onTap: () => _selectDate(context),
          onSaved: (value) {
            widget.onSaved?.call(selectedDate);
          },
          validator: (value) {
            String? dateString =
                isDateSelected ? selectedDate.toString() : null;
            return widget.validator?.call(dateString);
          },
          keyboardType: TextInputType.none,
        )
      ],
    );
  }
}
