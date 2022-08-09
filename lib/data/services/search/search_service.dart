import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:personal_pjt/data/api/api_client.dart';
import 'package:personal_pjt/data/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:personal_pjt/models/models.dart';
import 'package:personal_pjt/models/search_model.dart';
import 'package:personal_pjt/models/serializers.dart';
import 'package:personal_pjt/views/screens/SearchPage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SearchService extends ApiService {
  SearchService({required ApiClient client}) : super(client: client);

//************************************ Spotify Search *********************************//
  Future<SearchPage> spotifySearch({SearchModel? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['ACCESS_TOKEN']}' //Temporarily using from env
      },
      queryParams: {
        "q": objToApi!.q,
        "type": objToApi.type,
        "market": objToApi.market,
        "limit": objToApi.limit,
        "offset": objToApi.offset,
      },
      path: '/search',
    );
    if (res.isSuccess) {
      return
    } else {
      throw res.error;
    }
  }
}
