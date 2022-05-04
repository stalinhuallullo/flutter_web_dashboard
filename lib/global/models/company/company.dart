import 'dart:convert';

import 'package:flutter_web_dashboard_multiempresas/global/models/company/audit_dto.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/company/client_detail.dart';

class Company {
    Company({
        required this.id,
        required this.fiscalName,
        required this.comercialName,
        required this.ruc,
        required this.phone,
        required this.contactEmail,
        required this.address,
        //required this.clientDetail,
        //required this.auditDTO,
    });

    String id;
    String fiscalName;
    String comercialName;
    String ruc;
    String phone;
    String contactEmail;
    String address;
    //ClientDetail clientDetail;
    //AuditDTO auditDTO;

    factory Company.fromJson(String str) => Company.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Company.fromMap(Map<String, dynamic> json) => Company(
        id: json["id"],
        fiscalName: json["fiscalName"],
        comercialName: json["comercialName"],
        ruc: json["ruc"],
        phone: json["phone"],
        contactEmail: json["contactEmail"],
        address: json["address"],
        //clientDetail: ClientDetail.fromMap( json["clientDetail"] ),
        //auditDTO: AuditDTO.fromMap( json["auditDTO"] ),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fiscalName": fiscalName,
        "comercialName": comercialName,
        "ruc": ruc,
        "phone": phone,
        "contactEmail": contactEmail,
        "address": address,
        //"clientDetail": clientDetail.toMap(),
        //"auditDTO": auditDTO.toMap(),
    };

}
