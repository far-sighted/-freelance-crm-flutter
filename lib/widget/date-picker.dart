import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final String label;
  final bool backgroud;

  const DatePicker({Key? key, required this.label, this.backgroud = false})
      : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();
  bool isDateSelected = false;

  Future<void> _selectDate(BuildContext context) async {
    setState(() {
      isDateSelected = false;
    });
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              letterSpacing: 0.5,
              fontSize: 13.0,
            )),
        const SizedBox(height: 4.0),
        TextFormField(
          decoration: InputDecoration(
            fillColor: widget.backgroud
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
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(8.0, 8.0)),
              borderSide: BorderSide(
                color: Colors.transparent,
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
          keyboardType: TextInputType.none,
          controller: TextEditingController(
            text: selectedDate.toString().substring(0, 10),
          ),
        )
      ],
    );
  }
}
