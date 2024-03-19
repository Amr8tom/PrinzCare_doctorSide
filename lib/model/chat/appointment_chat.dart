// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentChat {
  String? _id;
  String? _image;
  String? _video;
  String? _msg;
  String? _msgType;
  VideoCall? _videoCall;
  ChatUser? _senderUser;

  AppointmentChat({
    String? id,
    String? image,
    String? video,
    String? msg,
    String? msgType,
    VideoCall? videoCall,
    ChatUser? senderUser,
  }) {
    _id = id;
    _image = image;
    _video = video;
    _msg = msg;
    _msgType = msgType;
    _videoCall = videoCall;
    _senderUser = senderUser;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": _id,
      "image": _image,
      "video": _video,
      "msg": _msg,
      "msgType": _msgType,
      "videoCall": _videoCall?.toJson(),
      "senderUser": _senderUser?.toJson(),
    };
  }

  AppointmentChat.fromJson(Map<String, dynamic>? json) {
    _id = json?["id"];
    _image = json?["image"];
    _video = json?["video"];
    _msg = json?["msg"];
    _msgType = json?["msgType"];
    _videoCall = VideoCall.fromJson(json?["videoCall"]);
    _senderUser = ChatUser.fromJson(json?["senderUser"]);
  }

  factory AppointmentChat.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return AppointmentChat(
      image: data?['image'],
      video: data?['video'],
      id: data?['id'],
      msg: data?['msg'],
      msgType: data?['msgType'],
      videoCall: VideoCall.fromJson(data?['videoCall']),
      senderUser: ChatUser.fromJson(data?["senderUser"]),
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      if (id != null) "id": _id,
      if (image != null) "image": _image,
      if (video != null) "video": _video,
      if (msg != null) "msg": _msg,
      if (msgType != null) "msgType": _msgType,
      if (videoCall != null) "videoCall": _videoCall,
      if (senderUser != null) "senderUser": _senderUser,
    };
  }

  ChatUser? get senderUser => _senderUser;

  String? get msgType => _msgType;

  String? get msg => _msg;

  String? get video => _video;

  String? get image => _image;

  VideoCall? get videoCall => _videoCall;

  String? get id => _id;
}

class VideoCall {
  String? _time;
  bool? _isStarted;
  String? _patientName;
  String? _patientImage;
  String? _channelId;
  String? _token;

  VideoCall(
      {String? time,
      bool? isStarted,
      String? patientName,
      String? patientImage,
      String? channelId,
      String? token}) {
    if (time != null) {
      _time = time;
    }
    if (isStarted != null) {
      _isStarted = isStarted;
    }
    if (patientName != null) {
      _patientName = patientName;
    }
    if (patientImage != null) {
      _patientImage = patientImage;
    }
    if (channelId != null) {
      _channelId = channelId;
    }
    if (token != null) {
      _token = token;
    }
  }

  String? get time => _time;

  set time(String? time) => _time = time;

  bool? get isStarted => _isStarted;

  set isStarted(bool? isStarted) => _isStarted = isStarted;

  String? get patientName => _patientName;

  set patientName(String? patientName) => _patientName = patientName;

  String? get patientImage => _patientImage;

  set patientImage(String? patientImage) => _patientImage = patientImage;

  String? get channelId => _channelId;

  set channelId(String? channelId) => _channelId = channelId;

  String? get token => _token;

  set token(String? token) => _token = token;

  VideoCall.fromJson(Map<String, dynamic> json) {
    _time = json['time'];
    _isStarted = json['isStarted'];
    _patientName = json['patientName'];
    _patientImage = json['patientImage'];
    _channelId = json['channelId'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = _time;
    data['isStarted'] = _isStarted;
    data['patientName'] = _patientName;
    data['patientImage'] = _patientImage;
    data['channelId'] = _channelId;
    data['token'] = _token;
    return data;
  }
}

class ChatUser {
  int? _userId;
  String? _name;
  String? _dob;
  String? _image;
  String? _identity;

  ChatUser({
    int? userId,
    String? name,
    int? age,
    String? dob,
    String? image,
    String? identity,
  }) {
    _userId = userId;
    _name = name;
    _dob = dob;
    _image = image;
    _identity = identity;
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': _userId,
      'name': _name,
      'dob': _dob,
      'image': _image,
      'identity': _identity,
    };
  }

  ChatUser.fromJson(Map<String, dynamic>? json) {
    _userId = json?['userId'];
    _name = json?['name'];
    _dob = json?['dob'];
    _image = json?['image'];
    _identity = json?['identity'];
  }

  String? get identity => _identity;

  String? get image => _image;

  String? get dob => _dob;

  String? get name => _name;

  int? get userId => _userId;
}
