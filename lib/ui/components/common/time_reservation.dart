import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting dates
import 'package:vida/constants/theme.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late String selectedDate;
  String? selectedTime;

  final List<String> timeSlots = [
    "am:09:00",
    "am:10:00",
    "am:11:00",
    "pm:12:00",
    "pm:01:00",
    "pm:02:00",
    "pm:03:00",
    "pm:04:00",
    "pm:05:00",
    "pm:06:00",
    "pm:07:00",
    "pm:08:00",
    "pm:09:00",
    "pm:10:00",
  ];

  @override
  void initState() {
    super.initState();
    selectedDate = DateFormat(
      'yyyy-MM-dd',
    ).format(DateTime.now()); // Default to today's date
  }

  List<String> getUpcomingDates() {
    return List.generate(7, (index) {
      DateTime date = DateTime.now().add(Duration(days: index));
      return DateFormat('yyyy-MM-dd').format(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        color: colorScheme.shadow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// **Dropdown for Date Selection**
            Row(
              children: [
                Text(
                  "يرجى تحديد موعد الحجز",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                    iconSize: 30,
                    menuMaxHeight: 400,
                    value: selectedDate,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDate = newValue!;
                      });
                    },
                    items:
                        getUpcomingDates().map<DropdownMenuItem<String>>((
                          String value,
                        ) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
            Divider(),
            SizedBox(height: 10),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  timeSlots.map((time) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          color:
                              selectedTime == time
                                  ? Colors.blue[300]
                                  : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                selectedTime == time
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
