// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  const Product({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.servicePrice,
    required this.price,
    required this.active,
    required this.fromCount,
    required this.tillCount,
    required this.everyCount,
    required this.state,
  });

  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final String updatedBy;
  final ServicePrice servicePrice;
  final int price;
  final bool active;
  final int fromCount;
  final int tillCount;
  final dynamic everyCount;
  final State state;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    servicePrice: ServicePrice.fromJson(json["servicePrice"]),
    price: json["price"],
    active: json["active"],
    fromCount: json["fromCount"],
    tillCount: json["tillCount"],
    everyCount: json["everyCount"],
    state: State.fromJson(json["state"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "servicePrice": servicePrice.toJson(),
    "price": price,
    "active": active,
    "fromCount": fromCount,
    "tillCount": tillCount,
    "everyCount": everyCount,
    "state": state.toJson(),
  };
}

class ServicePrice {
  const ServicePrice({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.service,
    required this.zipCode,
    required this.price,
    required this.active,
    required this.chargeMinute,
    required this.chargePercent,
    required this.hibernateLazyInitializer,
  });

 final String id;
 final DateTime createdAt;
 final DateTime updatedAt;
 final String createdBy;
 final String updatedBy;
 final Service service;
 final ZipCode zipCode;
 final double price;
 final bool active;
 final int chargeMinute;
 final int chargePercent;
 final HibernateLazyInitializer hibernateLazyInitializer;

  factory ServicePrice.fromJson(Map<String, dynamic> json) => ServicePrice(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    service: Service.fromJson(json["service"]),
    zipCode: ZipCode.fromJson(json["zipCode"]),
    price: json["price"].toDouble(),
    active: json["active"],
    chargeMinute: json["chargeMinute"],
    chargePercent: json["chargePercent"],
    hibernateLazyInitializer: HibernateLazyInitializer.fromJson(json["hibernateLazyInitializer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "service": service.toJson(),
    "zipCode": zipCode.toJson(),
    "price": price,
    "active": active,
    "chargeMinute": chargeMinute,
    "chargePercent": chargePercent,
    "hibernateLazyInitializer": hibernateLazyInitializer.toJson(),
  };
}

class HibernateLazyInitializer {
  HibernateLazyInitializer();

  factory HibernateLazyInitializer.fromJson(Map<String, dynamic> json) => HibernateLazyInitializer(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Service {
  const Service({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.mainService,
    required this.subService,
    required this.initialCount,
    required this.initialSpendingTime,
    required this.everyCount,
    required this.everySpendingTime,
    required this.serviceDynamic,
    required this.active,
    required this.embassy,
    required this.hibernateLazyInitializer,
  });

  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final String updatedBy;
  final MainService mainService;
  final State subService;
  final int initialCount;
  final int initialSpendingTime;
  final int everyCount;
  final int everySpendingTime;
  final bool serviceDynamic;
  final bool active;
  final dynamic embassy;
  final HibernateLazyInitializer hibernateLazyInitializer;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    mainService: MainService.fromJson(json["mainService"]),
    subService: State.fromJson(json["subService"]),
    initialCount: json["initialCount"],
    initialSpendingTime: json["initialSpendingTime"],
    everyCount: json["everyCount"],
    everySpendingTime: json["everySpendingTime"],
    serviceDynamic: json["dynamic"],
    active: json["active"],
    embassy: json["embassy"],
    hibernateLazyInitializer: HibernateLazyInitializer.fromJson(json["hibernateLazyInitializer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "mainService": mainService.toJson(),
    "subService": subService.toJson(),
    "initialCount": initialCount,
    "initialSpendingTime": initialSpendingTime,
    "everyCount": everyCount,
    "everySpendingTime": everySpendingTime,
    "dynamic": serviceDynamic,
    "active": active,
    "embassy": embassy,
    "hibernateLazyInitializer": hibernateLazyInitializer.toJson(),
  };
}

class MainService {
  const MainService({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.name,
    required this.active,
    required this.description,
    required this.fromTime,
    required this.tillTime,
    required this.online,
    required this.orderNumber,
    required this.hibernateLazyInitializer,
  });

  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final String updatedBy;
  final String name;
  final bool active;
  final String description;
  final String fromTime;
  final String tillTime;
  final bool online;
  final dynamic orderNumber;
  final HibernateLazyInitializer hibernateLazyInitializer;

  factory MainService.fromJson(Map<String, dynamic> json) => MainService(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    name: json["name"],
    active: json["active"],
    description: json["description"],
    fromTime: json["fromTime"],
    tillTime: json["tillTime"],
    online: json["online"],
    orderNumber: json["orderNumber"],
    hibernateLazyInitializer: HibernateLazyInitializer.fromJson(json["hibernateLazyInitializer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "name": name,
    "active": active,
    "description": description,
    "fromTime": fromTime,
    "tillTime": tillTime,
    "online": online,
    "orderNumber": orderNumber,
    "hibernateLazyInitializer": hibernateLazyInitializer.toJson(),
  };
}

class State {
  const State({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.name,
    required this.active,
    required this.description,
    required this.defaultInput,
    required this.serviceEnum,
    required this.hibernateLazyInitializer,
    required this.state,
    required this.percent,
  });

  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final String updatedBy;
  final String name;
  final bool active;
  final String description;
  final bool defaultInput;
  final String serviceEnum;
  final HibernateLazyInitializer hibernateLazyInitializer;
  final State? state;
  final dynamic percent;

  factory State.fromJson(Map<String, dynamic> json) => State(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    name: json["name"],
    active: json["active"],
    description: json["description"] == null ? null : json["description"],
    defaultInput: json["defaultInput"] == null ? null : json["defaultInput"],
    serviceEnum: json["serviceEnum"] == null ? null : json["serviceEnum"],
    hibernateLazyInitializer: HibernateLazyInitializer.fromJson(json["hibernateLazyInitializer"]),
    state: json["state"] == null ? null : State.fromJson(json["state"]),
    percent: json["percent"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "name": name,
    "active": active,
    "description": description == null ? null : description,
    "defaultInput": defaultInput == null ? null : defaultInput,
    "serviceEnum": serviceEnum == null ? null : serviceEnum,
    "hibernateLazyInitializer": hibernateLazyInitializer.toJson(),
    "state": state != null ? state?.toJson() : null,
    "percent": percent,
  };
}

class ZipCode {
  const ZipCode({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
    required this.code,
    required this.county,
    required this.city,
    required this.active,
    required this.timezone,
    required this.hibernateLazyInitializer,
  });

  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final String updatedBy;
  final String code;
  final State county;
  final String city;
  final bool active;
  final Timezone timezone;
  final HibernateLazyInitializer hibernateLazyInitializer;

  factory ZipCode.fromJson(Map<String, dynamic> json) => ZipCode(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    code: json["code"],
    county: State.fromJson(json["county"]),
    city: json["city"],
    active: json["active"],
    timezone: Timezone.fromJson(json["timezone"]),
    hibernateLazyInitializer: HibernateLazyInitializer.fromJson(json["hibernateLazyInitializer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "code": code,
    "county": county.toJson(),
    "city": city,
    "active": active,
    "timezone": timezone.toJson(),
    "hibernateLazyInitializer": hibernateLazyInitializer.toJson(),
  };
}

class Timezone {
  const Timezone({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
