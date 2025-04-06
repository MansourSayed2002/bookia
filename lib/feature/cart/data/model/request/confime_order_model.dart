class ConfimeOrderModel {
  ConfimeOrderModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.governorateId,
  });
  final String governorateId;
  final String name;
  final String phone;
  final String address;
  final String email;

  Map<String, dynamic> toJson() => {
    "governorate_id": governorateId,
    "name": name,
    "phone": phone,
    "address": address,
    "email": email,
  };
}
