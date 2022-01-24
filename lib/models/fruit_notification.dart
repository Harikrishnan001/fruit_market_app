class FruitNotification {
  final String imageURL;
  final String message;
  final String description;
  final DateTime time;

  FruitNotification({
    required this.imageURL,
    required this.message,
    required this.description,
    required this.time,
  });

  bool arrivedToday() {
    final now = DateTime.now();
    DateTime start = DateTime(now.year, now.month, now.day, 0, 0, 0, 0, 0);
    return time.isAfter(start);
  }

  bool arrivedYesterday() {
    if (arrivedToday()) return false;
    DateTime now = DateTime.now();
    final yesterday = now.subtract(const Duration(hours: 48));
    return time.isAfter(yesterday);
  }

  bool arrivedThisWeek() {
    if (arrivedYesterday()) return false;
    DateTime now = DateTime.now();
    final thisWeek = now.subtract(const Duration(days: 7));
    return time.isAfter(thisWeek);
  }

  String getArrivalMessage() {
    if (DateTime.now().difference(time).inSeconds < 60) {
      return "Now";
    } else if (DateTime.now().difference(time).inMinutes < 10) {
      return "Few minutes ago";
    } else if (DateTime.now().difference(time).inMinutes < 60) {
      return "${DateTime.now().difference(time).inMinutes} minutes ago";
    } else if (DateTime.now().difference(time).inHours < 24) {
      return "${DateTime.now().difference(time).inHours} hours ago";
    } else if (DateTime.now().difference(time).inDays < 7) {
      return "${DateTime.now().difference(time).inDays} days ago";
    } else if (DateTime.now().difference(time).inDays < 60) {
      return "Few weeks ago";
    } else if (DateTime.now().difference(time).inDays < 365) {
      return "This year";
    } else {
      return "A long ago";
    }
  }
}
