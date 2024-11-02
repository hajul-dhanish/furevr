import 'package:cloud_firestore/cloud_firestore.dart';

class GroomingServiceModel {
  final int? brandId;
  final List<int>? services;
  final String? gstNo;
  final String? brand;
  final String? branch;
  final String? type;
  final int? yearIncorporate;
  final Map<String, String>? closeTime;
  final Map<String, String>? openTime;
  final int? branchId;
  final Timestamp? dateOnboarding;
  final List<String>? image;

  GroomingServiceModel({
    this.brandId,
    this.services,
    this.gstNo,
    this.brand,
    this.branch,
    this.type,
    this.yearIncorporate,
    this.closeTime,
    this.openTime,
    this.branchId,
    this.dateOnboarding,
    this.image,
  });

  // Factory constructor to parse JSON into GroomingServiceModel
  factory GroomingServiceModel.fromJson(Map<String, dynamic> json) {
    return GroomingServiceModel(
      brandId: json['brand_id'] as int?,
      services:
          (json['services'] as List<dynamic>?)?.map((e) => e as int).toList(),
      gstNo: json['gst_no'] as String?,
      brand: json['brand'] as String?,
      branch: json['branch'] as String?,
      type: json['type'] as String?,
      yearIncorporate: json['year_incorporate'] as int?,
      closeTime: (json['close_time'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
      openTime: (json['open_time'] as Map<String, dynamic>?)
          ?.map((key, value) => MapEntry(key, value as String)),
      branchId: json['branch_id'] as int?,
      dateOnboarding: json['date_onboarding'] as Timestamp?,
      image:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }

  // Method to convert GroomingServiceModel back to JSON
  Map<String, dynamic> toJson() {
    return {
      'brand_id': brandId,
      'services': services,
      'gst_no': gstNo,
      'brand': brand,
      'branch': branch,
      'type': type,
      'year_incorporate': yearIncorporate,
      'close_time': closeTime,
      'open_time': openTime,
      'branch_id': branchId,
      'date_onboarding': dateOnboarding,
      'image': image,
    };
  }
}
