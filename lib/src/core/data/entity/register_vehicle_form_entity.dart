class RegisterVehicleFormEntity {
  String registrationNumber;
  String propertyCard;
  String numberOfAxes;
  String width;
  String long;
  bool hasRefrigeration;
  bool hasSure;
  bool hasSoat;

  RegisterVehicleFormEntity({
    this.registrationNumber = '',
    this.propertyCard = '',
    this.numberOfAxes = '',
    this.width = '',
    this.long = '',
    this.hasRefrigeration = false,
    this.hasSure = false,
    this.hasSoat = false,
  });

  RegisterVehicleFormEntity copy({
    String? registrationNumber,
    String? propertyCard,
    String? numberOfAxes,
    String? width,
    String? long,
    bool? hasRefrigeration,
    bool? hasSure,
    bool? hasSoat,
  }) =>
      RegisterVehicleFormEntity(
        registrationNumber: registrationNumber ?? this.registrationNumber,
        propertyCard:  propertyCard ?? this.propertyCard,
        numberOfAxes: numberOfAxes ?? this.numberOfAxes,
        width: width ?? this.width,
        long: long ?? this.long,
        hasRefrigeration: hasRefrigeration ?? this.hasRefrigeration,
        hasSure: hasSure ?? this.hasSure,
        hasSoat: hasSoat ?? this.hasSoat,

      );
}
