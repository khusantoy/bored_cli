import 'dart:convert';

import 'package:http/http.dart' as http;

class Activity {
  String title;
  String type;
  int pasrticipants;

  Activity(this.title, this.type, this.pasrticipants);

  // display data
  @override
  String toString() {
    return """
Title: $title
Type: $type
Participants: $pasrticipants
""";
  }
}

void main() {
  var url = Uri.parse("https://www.boredapi.com/api/activity");
  // get data from url
  http.get(url).then((data) {
    Map<String, dynamic> response = jsonDecode(data.body);

    String title = response['activity'];
    String type = response['type'];
    int participants = response['participants'];

    Activity activity = Activity(title, type, participants);

    // display results
    print(activity.toString());
  });
}
