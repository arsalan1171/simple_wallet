class Customer {
  int? customerId;
  String? name;
  String? email;
  String? phone;
  String? type;
  String? dateCreated;

  Customer(
      {this.customerId,
      this.name,
      this.email,
      this.phone,
      this.type,
      this.dateCreated});

  factory Customer.fromJson(Map<String, dynamic> responseData) {
    return Customer(
        customerId: responseData['id'],
        name: responseData['name'],
        email: responseData['email'],
        phone: responseData['phone'],
        type: responseData['type'],
        dateCreated: responseData['date_created']);
  }
}
