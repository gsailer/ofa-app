class OFAjson {
  List<OffFacebookActivity> offFacebookActivity;

  OFAjson({this.offFacebookActivity});

  OFAjson.fromJson(Map<String, dynamic> json) {
    if (json['off_facebook_activity'] != null) {
      offFacebookActivity = new List<OffFacebookActivity>();
      json['off_facebook_activity'].forEach((v) {
        offFacebookActivity.add(new OffFacebookActivity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.offFacebookActivity != null) {
      data['off_facebook_activity'] =
          this.offFacebookActivity.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OffFacebookActivity {
  String name;
  List<Events> events;

  OffFacebookActivity({this.name, this.events});

  OffFacebookActivity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['events'] != null) {
      events = new List<Events>();
      json['events'].forEach((v) {
        events.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  int id;
  String type;
  int timestamp;

  Events({this.id, this.type, this.timestamp});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['timestamp'] = this.timestamp;
    return data;
  }
}
