class Dataset {
  final Map<String, dynamic> data;
  final Map<String, dynamic> support;
  final int? id;
  final String? email;
  final String? first_name;
  final String? last_name;
  final String? avatar;
  final String? url;
  final String? text;


  const Dataset({
    required this.data,
    required this.support,
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
    required this.url,
    required this.text,

  });

  factory Dataset.fromJson(Map<String, dynamic> json) {
    return Dataset(
      data: json['data'],
      support: json['support'],
      id: json['data']['id'],
      email: json['data']['email'],
      first_name: json['data']['first_name'],
      last_name: json['data']['last_name'],
      avatar: json['data']['avatar'],
      url: json['data']['url'],
      text: json['data']['text'],
    );
  }
}