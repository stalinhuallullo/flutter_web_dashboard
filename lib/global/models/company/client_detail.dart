import 'dart:convert';

import 'package:flutter_web_dashboard_multiempresas/global/models/company/authorized_grant_types.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/company/registered_redirect_uris.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/company/resource.dart';
import 'package:flutter_web_dashboard_multiempresas/global/models/company/scope.dart';

class ClientDetail {
    ClientDetail({
        required this.clientId,
        required this.scope,
        required this.resourceIds,
        required this.authorizedGrantTypes,
        required this.registeredRedirectUris,
        required this.accessTokenValiditySeconds,
        required this.refreshTokenValiditySeconds,
    });

    String clientId;
    Scope scope;
    Resource resourceIds;
    AuthorizedGrantTypes authorizedGrantTypes;
    RegisteredRedirectUris registeredRedirectUris;
    int accessTokenValiditySeconds;
    int refreshTokenValiditySeconds;

    factory ClientDetail.fromJson(String str) => ClientDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClientDetail.fromMap(Map<String, dynamic> json) => ClientDetail(
        clientId: json["clientId"],
        scope: json["scope"],
        resourceIds: Resource.fromMap( json["resourceIds"] ),
        authorizedGrantTypes: AuthorizedGrantTypes.fromMap( json["authorizedGrantTypes"] ),
        registeredRedirectUris: RegisteredRedirectUris.fromMap( json["registeredRedirectUris"] ),
        accessTokenValiditySeconds: json["accessTokenValiditySeconds"],
        refreshTokenValiditySeconds: json["refreshTokenValiditySeconds"],
    );

    Map<String, dynamic> toMap() => {
        "clientId": clientId,
        "scope": scope,
        "resourceIds": resourceIds.toMap(),
        "authorizedGrantTypes": authorizedGrantTypes.toMap(),
        "registeredRedirectUris": registeredRedirectUris.toMap(),
        "accessTokenValiditySeconds": accessTokenValiditySeconds,
        "refreshTokenValiditySeconds": refreshTokenValiditySeconds,
    };
}

