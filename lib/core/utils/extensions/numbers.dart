
extension Range on num {
  bool isBetween(num from, num to) {
    return from <= this && this <= to;
  }

  bool notBounded(num from, num to) {
    return from < this && this < to;
  }
}