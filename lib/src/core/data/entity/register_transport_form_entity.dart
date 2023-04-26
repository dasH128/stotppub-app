class RegisterTransportFormEntity {
  String? id;
  String name;
  String lastName;
  String ruc;
  String address;
  String number;
  String licenseNumber;
  String categoryLicense;
  String email;
  String password;

  RegisterTransportFormEntity({
    this.id,
    this.name = '',
    this.lastName = '',
    this.ruc = '',
    this.address = '',
    this.number = '',
    this.licenseNumber = '3235',
    this.categoryLicense = 'A I',
    this.email = '',
    this.password = '',
  });

  RegisterTransportFormEntity copy({
    String? id,
    String? name,
    String? lastName,
    String? ruc,
    String? address,
    String? number,
    String? licenseNumber,
    String? categoryLicense,
    String? email,
    String? password,
  }) =>
      RegisterTransportFormEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        ruc: ruc ?? this.ruc,
        address: address ?? this.address,
        number: number ?? this.number,
        licenseNumber: licenseNumber ?? this.licenseNumber,
        categoryLicense: categoryLicense ?? this.categoryLicense,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  // validateNameForm() {}
}
