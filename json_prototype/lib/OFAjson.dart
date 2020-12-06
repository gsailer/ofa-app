// To parse this JSON data, do
//
//     final jsonEvents = jsonEventsFromJson(jsonString);

import 'dart:convert';

OFAjson jsonEventsFromJson(String str) => OFAjson.fromJson(json.decode(str));

String jsonEventsToJson(OFAjson data) => json.encode(data.toJson());

class OFAjson {
    OFAjson({
        this.offFacebookActivity,
    });

    List<OffFacebookActivity> offFacebookActivity;

    factory OFAjson.fromJson(Map<String, dynamic> json) => OFAjson(
        offFacebookActivity: List<OffFacebookActivity>.from(json["off_facebook_activity"].map((x) => OffFacebookActivity.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "off_facebook_activity": List<dynamic>.from(offFacebookActivity.map((x) => x.toJson())),
    };
}

class OffFacebookActivity {
    OffFacebookActivity({
        this.name,
        this.events,
    });

    String name;
    List<Event> events;

    factory OffFacebookActivity.fromJson(Map<String, dynamic> json) => OffFacebookActivity(
        name: json["name"],
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
    };
}

class Event {
    Event({
        this.id,
        this.type,
        this.timestamp,
    });

    int id;
    Type type;
    int timestamp;

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        type: typeValues.map[json["type"]],
        timestamp: json["timestamp"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "timestamp": timestamp,
    };
}

enum Type { CUSTOM, SEARCH, ACTIVATE_APP, LEVEL_ACHIEVED, RESULT_SENT, LEAD, CONTACT, PAGE_VIEW, COMPLETE_REGISTRATION, AD_REQUEST, SPENT_CREDITS, TOSIMPRESSION, AD_CLICK, VIEW_CONTENT, PURCHASE }

final typeValues = EnumValues({
    "ACTIVATE_APP": Type.ACTIVATE_APP,
    "AD_CLICK": Type.AD_CLICK,
    "AD_REQUEST": Type.AD_REQUEST,
    "COMPLETE_REGISTRATION": Type.COMPLETE_REGISTRATION,
    "CONTACT": Type.CONTACT,
    "CUSTOM": Type.CUSTOM,
    "LEAD": Type.LEAD,
    "LEVEL_ACHIEVED": Type.LEVEL_ACHIEVED,
    "PAGE_VIEW": Type.PAGE_VIEW,
    "PURCHASE": Type.PURCHASE,
    "RESULT_SENT": Type.RESULT_SENT,
    "SEARCH": Type.SEARCH,
    "SPENT_CREDITS": Type.SPENT_CREDITS,
    "TOSIMPRESSION": Type.TOSIMPRESSION,
    "VIEW_CONTENT": Type.VIEW_CONTENT
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
