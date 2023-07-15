extension StringX on String {
  bool containsIgnoreLowerCase(String other) =>
      toLowerCase().contains(other.toLowerCase());
}
