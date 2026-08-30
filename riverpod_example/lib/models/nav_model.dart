class NavModel {
  String? id;
  String? title;
  String? icon;

  NavModel({this.id, this.title, this.icon});

  factory NavModel.fromJson(Map<String, dynamic> json) {
    return NavModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      icon: json['icon'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'icon': icon};
  }
}
