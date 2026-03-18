import 'package:e_hospital_service/models/appointment_model.dart';

class AppointmentService {
  Future<List<AppointmentModel>> getUpcomingAppointments() async {
    await Future.delayed(const Duration(milliseconds: 500));
    final now = DateTime.now();
    return [
      AppointmentModel(
          id: 'apt-001',
          doctorName: 'Dr. Sarah Johnson',
          specialization: 'General Checkup',
          dateTime: DateTime(now.year, now.month, now.day, 10, 0),
          status: 'upcoming'),
      AppointmentModel(
          id: 'apt-002',
          doctorName: 'Dr. Michael Chen',
          specialization: 'Cardiology',
          dateTime: now.add(const Duration(days: 3, hours: 2)),
          status: 'upcoming')
    ];
  }

  Future<Map<String, int>> getStats() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return {'upcoming': 2, 'doctors': 5, 'records': 12};
  }
}
