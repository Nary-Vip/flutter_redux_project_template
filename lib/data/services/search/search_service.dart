import 'dart:async';
import 'package:personal_pjt/data/api/api_client.dart';
import 'package:personal_pjt/data/services/api_service.dart';
import 'package:personal_pjt/models/library_album_result.dart';
import 'package:personal_pjt/models/models.dart';
import 'package:personal_pjt/models/search_track_result.dart';
import 'package:personal_pjt/models/user_profile.dart';

class SearchService extends ApiService {
  SearchService({required ApiClient client}) : super(client: client);

//************************************ Spotify Search *********************************//
  Future<SearchTrackResult?> spotifySearch({SearchModel? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${objToApi!.token}'
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
      return res.data!.tracks;
    } else {
      throw res.error;
    }
  }

  Future<ApiSuccess?> fetchGenre(String token) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      path: '/recommendations/available-genre-seeds',
    );
    if (res.isSuccess) {
      return res.data!;
    } else {
      throw res.error;
    }
  }

  Future<ApiSuccess?> fetchPlaylist(String token) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      path: '/browse/featured-playlists',
    );
    if (res.isSuccess) {
      return res.data!;
    } else {
      throw res.error;
    }
  }

  Future<ApiSuccess?> fetchLatestAlbums(String token) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      path: '/browse/new-releases',
    );
    if (res.isSuccess) {
      return res.data!;
    } else {
      throw res.error;
    }
  }

  Future<UserProfile?> fetchUserProfile(String token) async {
    final ApiResponse<UserProfile> res = await client!.callJsonApi<UserProfile>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      path: '/users/31nul3com6gwnuv3j7cnn4gedolu',
    );
    if (res.isSuccess) {
      return res.data!;
    } else {
      throw res.error;
    }
  }

  Future<LibraryAlbumResult?> fetchUserSavedAlbum(String token) async {
    final ApiResponse<LibraryAlbumResult> res =
        await client!.callJsonApi<LibraryAlbumResult>(
      method: Method.GET,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      path: '/me/albums',
    );
    if (res.isSuccess) {
      return res.data!;
    } else {
      throw res.error;
    }
  }

  Future<LibraryAlbumResult?> deleteSavedAlbum(String token, String id) async {
    final ApiResponse<LibraryAlbumResult> res =
        await client!.callJsonApi<LibraryAlbumResult>(
      method: Method.DELETE,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      queryParams: {"ids": "$id"},
      path: '/me/albums',
    );
    if (res.isSuccess) {
      return res.data!;
    } else {
      throw res.error;
    }
  }
}
