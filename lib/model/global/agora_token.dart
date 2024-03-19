class AgoraToken {
  AgoraToken({
    bool? status,
    String? message,
    String? token,
  }) {
    _status = status;
    _message = message;
    _token = token;
  }

  AgoraToken.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _token = json['token'];
  }

  bool? _status;
  String? _message;
  String? _token;

  AgoraToken copyWith({
    bool? status,
    String? message,
    String? token,
  }) =>
      AgoraToken(
        status: status ?? _status,
        message: message ?? _message,
        token: token ?? _token,
      );

  bool? get status => _status;

  String? get message => _message;

  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['token'] = _token;
    return map;
  }
}
