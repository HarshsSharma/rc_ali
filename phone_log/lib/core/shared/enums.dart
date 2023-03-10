enum GridType { oneLine, twoLine, threeLine }

enum MuteDuration {
  for15min(Duration(minutes: 15), 'For 15 minutes'),
  for1Hour(Duration(hours: 1), 'For 1 hour'),
  for8min(Duration(hours: 8), 'For 8 hours'),
  for24min(Duration(hours: 24), 'For 24 hours');

  final Duration duration;
  final String title;
  const MuteDuration(this.duration, this.title);
}
