class GeneralUtils {
  String getPeriodOfDay() {
    final date = DateTime.now();

    if (date.hour >= 5 && date.hour < 12) {
      return 'Morning';
    } else if (date.hour >= 12 && date.hour < 17) {
      return 'Afternoon';
    } else {
      return 'Evening';
    }
  }
}
