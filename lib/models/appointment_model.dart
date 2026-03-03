class AppointmentModel {
  final String id;
  final String doctorName;
  final String specialization;
  final DateTime dateTime;
  final String status;

  AppointmentModel(
      {required this.id,
      required this.doctorName,
      required this.specialization,
      required this.dateTime,
      required this.status});

  bool get isToday {
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }

  String get formattedTime {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour < 12 ? 'AM' : 'PM';
    final h = dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    return '${h.toString().padLeft(2, '0')}:$minute $period';
  }

  String get formattedDate {
    if (isToday) return 'Today';
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return '${months[dateTime.month - 1]} ${dateTime.day}';
  }
}
