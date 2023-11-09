bool isExpired(DateTime time, Duration limit) {
  final expiresIn = time.add(limit);
  return DateTime.now().isAfter(expiresIn);
}
