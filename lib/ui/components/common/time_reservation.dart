import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vida/constants/theme.dart';
import 'package:vida/services/api_services/availability_services.dart';

class TimeReservation extends StatefulWidget {
  final String spaceType;

  const TimeReservation({super.key, required this.spaceType});

  @override
  _TimeReservationState createState() => _TimeReservationState();
}

class _TimeReservationState extends State<TimeReservation> {
  late String selectedDate;
  String? selectedTime;

  List<String> timeSlots = [];
  bool isLoading = true;
  bool isError = false;
  final availabilityService = AvailabilityServices();

  @override
  void initState() {
    super.initState();
    selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    fetchTimeSlots();
  }

  Future<void> fetchTimeSlots() async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      final availabilityList = await availabilityService.fetchAvailability();
      final selectedDay = DateTime.parse(selectedDate).weekday;

      final dayAvailability =
          availabilityList
              .where(
                (availability) =>
                    availability.dayOfWeek == selectedDay &&
                    availability.isActive,
              )
              .toList();

      if (dayAvailability.isNotEmpty) {
        final slots =
            dayAvailability.map((availability) {
              final openFormatted = _formatTime(availability.openTime);
              final closeFormatted = _formatTime(availability.closeTime);
              return '$openFormatted - $closeFormatted';
            }).toList();

        setState(() {
          timeSlots = slots;
          isLoading = false;
        });
      } else {
        setState(() {
          timeSlots = [];
          isLoading = false;
        });
      }
    } catch (e) {
      log('Error fetching availability: $e');
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  List<String> getUpcomingDates() {
    return List.generate(7, (index) {
      DateTime date = DateTime.now().add(Duration(days: index));
      return DateFormat('yyyy-MM-dd').format(date);
    });
  }

  String _formatTime(String timeString) {
    try {
      final parsedTime = DateFormat.Hms().parse(timeString);
      return DateFormat.Hm().format(parsedTime);
    } catch (e) {
      return timeString;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height * 0.25,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        color: colorScheme.shadow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DropdownButton<String>(
                    iconSize: 30,
                    underline: const SizedBox(),
                    value: selectedDate,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedDate = newValue;
                          selectedTime = null;
                        });
                        fetchTimeSlots();
                      }
                    },
                    items:
                        getUpcomingDates().map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10),

            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (isError)
              const Center(
                child: Text(
                  "حدث خطأ أثناء تحميل الأوقات",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              )
            else if (timeSlots.isEmpty)
              const Center(
                child: Text(
                  "لا توجد مواعيد متاحة",
                  style: TextStyle(color: Colors.orange, fontSize: 16),
                ),
              )
            else
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children:
                    timeSlots.map((time) {
                      final isSelected = selectedTime == time;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = time;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isSelected
                                    ? Colors.blue[300]
                                    : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            time,
                            style: TextStyle(
                              fontSize: 15,
                              color: isSelected ? Colors.white : Colors.black,
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
