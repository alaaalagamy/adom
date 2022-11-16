class Device {
  num id;
  String d_label;
  String pi_address;
  num d_category;
  num created_by;
  Device({required this.id, required this.d_label, required this.created_by, required this.d_category, required this.pi_address});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
        id: json['id'],
        d_label: json['d_label'] != null ? json['d_label'] : '',
        created_by: json['created_by'],
        d_category: json['d_category'],
        pi_address: json['pi_address'] != null ? json['pi_address'] : '');
  }
}
