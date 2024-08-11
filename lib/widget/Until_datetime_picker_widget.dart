import "package:flutter_lusso2/widget/button_widget.dart";
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UntilDatetimePickerWidget extends StatefulWidget {
  @override
  _DatetimePickerWidgetState createState() => _DatetimePickerWidgetState();
}

class _DatetimePickerWidgetState extends State<UntilDatetimePickerWidget> {
  DateTime dateTime;

  String getDate() {
    if (dateTime == null) {
      return 'Select Date & Time';
    } else {
      return DateFormat('MM/dd/yyyy    HH:mm').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Until',
        text: getDate(),
        onClicked: () => pickOnlyDateTime(context),
      );

  Future pickOnlyDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future<TimeOfDay> pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: dateTime != null
          ? TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
          : initialTime,
    );

    if (newTime == null) return null;

    return newTime;
  }
}
