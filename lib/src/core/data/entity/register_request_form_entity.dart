class RegisterRequestFormEntity {
  String ruc;
  String number;
  String email;
  String address;
  String date;
  String product;
  String quantity;

  RegisterRequestFormEntity({
    this.ruc = '',
    this.number = '',
    this.email = '',
    this.address = '',
    this.date = '',
    this.product = '',
    this.quantity = '',
  });

  RegisterRequestFormEntity copy({
    String? ruc,
    String? number,
    String? email,
    String? address,
    String? date,
    String? product,
    String? quantity,
  }) =>
      RegisterRequestFormEntity(
        ruc: ruc ?? this.ruc,
        number: number ?? this.number,
        email: email ?? this.email,
        address: address ?? this.address,
        date: date ?? this.date,
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
      );
}
