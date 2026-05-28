import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  tz.initializeTimeZones();

  // first without a "Z" at the end -> time string is interpreted as local time
  var parsed = DateTime.parse("2026-05-29T00:00");
  print("parsed: $parsed");
  var parsedInUTC = parsed.toUtc();
  print("parsedInUTC: $parsedInUTC");

  var timezoneName = "Europe/Berlin"; // "Australia/Sydney"
  var tzLocation = tz.getLocation(timezoneName);
  var tzFromParsed = tz.TZDateTime.from(parsed, tzLocation);
  print("tzFromParsed: $tzFromParsed");
  var tzFromParsedInUTC = tz.TZDateTime.from(parsedInUTC, tzLocation);
  print("tzFromParsedInUTC: $tzFromParsedInUTC");
}
