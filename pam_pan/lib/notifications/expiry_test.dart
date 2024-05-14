class ExpiryTest {
  static final List<List<String>> items = [
    ["2024-05-15", "Item1"],
    ["2024-05-16", "Item2"],
    ["2024-05-17", "Item3"],
    ["2024-05-18", "Item4"],
    ["2024-05-19", "Item5"],
  ];

  static List<List<String>> sortList(List<List<String>> list) {
    list.sort((a, b) => a[0].compareTo(b[0]));
    return list;
  }

  static DateTime stringToDate(String date) {
    return DateTime.parse(date);
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
