class RegisterOrderFormEntity {
  String? id;
  String phone;
  String? dni;
  String idClient;
  String idDriver;
  String idVehicle;
  String address;
  String date;
  String idPerecedero;
  String product;
  String quantity;
  String? state;

  RegisterOrderFormEntity({
    this.id,
    this.phone = '',
    this.dni = '',
    this.idClient = '',
    this.idDriver = '',
    this.idVehicle = '',
    this.address = '',
    this.date = '',
    this.idPerecedero = '',
    this.product = '',
    this.quantity = '',
    this.state = 'PROCESO',
  });

  RegisterOrderFormEntity copy({
    String? id,
    String? dni,
    String? phone,
    String? idClient,
    String? idDriver,
    String? idVehicle,
    String? address,
    String? date,
    String? idPerecedero,
    String? product,
    String? quantity,
    String? state,
  }) =>
      RegisterOrderFormEntity(
        id: id ?? this.id,
        dni: dni ?? this.dni,
        phone: phone ?? this.phone,
        idClient: idClient ?? this.idClient,
        idDriver: idDriver ?? this.idDriver,
        idVehicle: idVehicle ?? this.idVehicle,
        address: address ?? this.address,
        date: date ?? this.date,
        idPerecedero: idPerecedero ?? this.idPerecedero,
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
        state: state ?? this.state,
      );
}
