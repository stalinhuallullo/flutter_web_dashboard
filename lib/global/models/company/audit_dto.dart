import 'dart:convert';

class AuditDTO {
    AuditDTO({
        required this.active,
        this.deleted,
        required this.created,
        this.updated,
    });

    String active;
    String? deleted;
    String created;
    String? updated;

    factory AuditDTO.fromJson(String str) => AuditDTO.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuditDTO.fromMap(Map<String, dynamic> json) => AuditDTO(
        active: json["active"],
        deleted: json["deleted"],
        created: json["created"],
        updated: json["updated"],
    );

    Map<String, dynamic> toMap() => {
        "active": active,
        "deleted": deleted,
        "created": created,
        "updated": updated,
    };

}




