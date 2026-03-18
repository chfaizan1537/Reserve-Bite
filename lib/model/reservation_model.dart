class Reservation {
  final String id;
  final String restaurantName;
  final DateTime date;
  final String time;
  final int guests;
  final String userId;
  final String? note;
  final String? status;


  Reservation({
    this.note,
    this.status,
    required this.id,
    required this.restaurantName,
    required this.date,
    required this.time,
    required this.guests,
    required this.userId,
  });
  factory Reservation.fromMap(Map<String, dynamic> map) {
    return Reservation(
      note: map['note'] as String?,
      status: map['status'] as String?,
      id: map['id'].toString(), // UUID → String
      restaurantName: map['resturant_name'] ?? '',
      date: DateTime.parse(map['date'].toString()),
      time: map['time']?.toString() ?? '',
      guests: int.tryParse(map['guests'].toString()) ?? 0,
      userId: map['user_id']?.toString() ?? '',
    );
  }
}