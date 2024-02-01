import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final String label;
  final DateTime? dateInitial;
  final Function(DateTime) onCountChange;
  final InputDecoration? inputDecoration;
  const DateWidget(
      {Key? key,
      required this.onCountChange,
      this.label='',
      this.dateInitial,
      this.inputDecoration })
      : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateInitial,
        firstDate: new DateTime(2008),
        lastDate: new DateTime(2030));
    if (picked != null) {
      onCountChange(picked);
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: InputDecorator(
        decoration: inputDecoration ?? InputDecoration(enabled: true)
            ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 10.0),
              child: Text(
                label,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Text(
                DateFormat.yMMMd().format(dateInitial ?? DateTime.now()),
              ),
            ),
            Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}
