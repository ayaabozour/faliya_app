import 'package:show_up_app/providers/base_provider.dart';

class AttendanceProvider extends BaseProvider {
  final String eventTitle = "Design Conference 2026";
  final String eventImage =
      "https://images.unsplash.com/photo-1503428593586-e225b39bddfe";
  final String eventDate = "12 Feb 2026 • 6:00 PM";

  List<Map<String, String>> pendingAttendees = [
    {
      "name": "John Doe",
      "major": "UX Designer",
      "time": "10:12 AM",
      "image":
          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d",
    },
    {
      "name": "Emma Smith",
      "major": "Product Designer",
      "time": "11:05 AM",
      "image":
          "https://images.unsplash.com/photo-1502767089025-6572583495b6",
    },
  ];

  List<Map<String, String>> acceptedAttendees = [
    {
      "name": "Liam Brown",
      "major": "UI Designer",
      "image":
          "https://images.unsplash.com/photo-1544005313-94ddf0286df2",
    },
    {
      "name": "Olivia Johnson",
      "major": "UX Researcher",
      "image":
          "https://images.unsplash.com/photo-1524504388940-b1c1722653e1",
    },
  ];

  AttendanceProvider(super.api);

  void acceptAttendee(int index) {
    final attendee = pendingAttendees.removeAt(index);
    acceptedAttendees.add(attendee);
    notifyListeners();
  }

  void rejectAttendee(int index) {
    pendingAttendees.removeAt(index);
    notifyListeners();
  }
}