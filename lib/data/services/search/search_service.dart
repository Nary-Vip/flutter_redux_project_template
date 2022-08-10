import 'dart:async';
import 'package:personal_pjt/data/api/api_client.dart';
import 'package:personal_pjt/data/services/api_service.dart';
import 'package:personal_pjt/models/models.dart';
import 'package:personal_pjt/models/search_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:personal_pjt/models/search_track_result.dart';

class SearchService extends ApiService {
  SearchService({required ApiClient client}) : super(client: client);

//************************************ Spotify Search *********************************//
  Future<SearchTrackResult?> spotifySearch({SearchModel? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${objToApi!.token}' //Temporarily using from env
      },
      queryParams: {
        "q": objToApi.q,
        "type": objToApi.type,
        "market": objToApi.market,
        "limit": "${objToApi.limit}",
        "offset": "${objToApi.offset}",
      },
      path: '/search',
    );
    if (res.isSuccess) {
      print("Success api");
      return res.data!.tracks;
    } else {
      print("Error api");
      throw res.error;
    }
  }

  Future<SearchTrackResult?> availableGenre({SearchModel? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer ${objToApi!.token}' //Temporarily using from env
      },
      queryParams: {
        "q": objToApi.q,
        "type": objToApi.type,
        "market": objToApi.market,
        "limit": "${objToApi.limit}",
        "offset": "${objToApi.offset}",
      },
      path: '/search',
    );
    if (res.isSuccess) {
      print("Success api");
      return res.data!.tracks;
    } else {
      print("Error api");
      throw res.error;
    }
  }
}
