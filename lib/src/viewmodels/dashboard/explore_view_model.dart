import 'package:placess_2021/src/core/base_view_model.dart';
import 'package:placess_2021/src/model/dashboard/place_model.dart';
import 'package:placess_2021/src/model/network_response_model.dart';
import 'package:placess_2021/src/services/dashboard/explore_service.dart';

class ExploreViewModel extends BaseViewModel {

  final ExploreService service;

  ExploreViewModel({required this.service});

  NetworkResponseModel get places => service.places!;
  Future<void> initialize() async {
    setBusy(true);
    await service.getAllPlaces();
    setBusy(false);
  }
}