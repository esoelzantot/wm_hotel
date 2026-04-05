class ContactUsEntity {
  final AddressEntity address;
  final String phone;
  final String email;

  final String map;

  ContactUsEntity({
    required this.address,
    required this.phone,
    required this.email,
    required this.map,
  });
}

class AddressEntity {
  final String arAddress;
  final String enAddress;

  AddressEntity({required this.arAddress, required this.enAddress});
}
