import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String? label;
  final String? placer;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  final bool background;

  final bool isError;
  final String? errorMessage;

  const DropDown({
    super.key,
    this.label,
    this.onChanged,
    this.placer,
    required this.items,
    this.selectedValue,
    this.background = false,
    this.isError = false,
    this.errorMessage = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 14.0,
            ),
          ),
        const SizedBox(height: 4.0),
        Container(
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.elliptical(8.0, 8.0)),
            color: background
                ? Theme.of(context).colorScheme.background
                : Theme.of(context).colorScheme.secondaryContainer,
            border: Border.all(
              color: isError
                  ? Theme.of(context).colorScheme.error
                  : Colors.transparent,
            ),
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            icon: const Icon(Icons.arrow_drop_down_rounded, size: 24.0),
            dropdownColor: Theme.of(context).colorScheme.surfaceVariant,
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2.0),
            elevation: 1,
            underline: Container(
              height: 0.0,
              color: Colors.transparent,
            ),
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 13.0,
            ),
            borderRadius: const BorderRadius.all(Radius.elliptical(8.0, 8.0)),
            items: [...items].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: onChanged,
            hint: Text(
              placer ?? "Select an option...",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
        if (isError || errorMessage != null && errorMessage!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
            child: Text(
              errorMessage!,
              style: TextStyle(
                  fontSize: 12, color: Theme.of(context).colorScheme.error),
            ),
          ),
      ],
    );
  }
}
