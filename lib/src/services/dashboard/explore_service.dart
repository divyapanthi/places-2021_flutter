import 'package:placess_2021/src/api/dashboard/explore_api.dart';
import 'package:placess_2021/src/model/dashboard/place_model.dart';
import 'package:placess_2021/src/model/network_response_model.dart';
import 'package:placess_2021/src/services/auth_rx_provider.dart';

class ExploreService {
  final ExploreApi api;
  final AuthRxProvider authRxProvider;

  ExploreService({required this.api, required this.authRxProvider});

  NetworkResponseModel? _places;
  NetworkResponseModel? get places => _places;

  Future<void> getAllPlaces() async {
    final response = await api.getAllPlaces();
    _places = response;
  }
}