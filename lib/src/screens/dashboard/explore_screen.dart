import 'package:flutter/material.dart';
import 'package:placess_2021/src/core/base_widget.dart';
import 'package:placess_2021/src/model/dashboard/place_model.dart';
import 'package:placess_2021/src/utils/image_helper.dart';
import 'package:placess_2021/src/viewmodels/dashboard/explore_view_model.dart';
import 'package:placess_2021/src/widgets/error_view.dart';
import 'package:placess_2021/src/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ExploreViewModel>(
        model: ExploreViewModel(service: Provider.of(context)),
        onModelReady: (model) async => await model.initialize(),
        builder: (context, ExploreViewModel model, Widget? child) {
          return Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: _buildBody(context, model),
          );
        });
  }

  Widget _buildBody(BuildContext context, ExploreViewModel model) {
    if (model.busy) {
      return LoadingIndicator();
    }
    if (model.places.status == false) {
      return ErrorView(
          messages: model.places.message!,
          callback: () async => await model.initialize());
    }
    return ListView.builder(
      itemCount: model.places.data.length,
      padding: EdgeInsets.only(bottom: 12),
      itemBuilder: (BuildContext context, int index) {
        final PlaceModel place = model.places.data[index] as PlaceModel;
        return _buildPlaceItem(context, place);
      },
    );
  }

  Widget _buildPlaceItem(BuildContext context, PlaceModel place) {
    return Container(
      margin: const EdgeInsets.only(bottom:8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                child: Image.network(getImage(place.image!)),
                borderRadius: BorderRadius.circular(12),
              ),
              SizedBox(height: 8),
              Text("${place.name}", style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 8),
              Text("Near: ${place.monument}"),
              SizedBox(height: 8),
              Text("${place.description}"),
            ],
          ),
        ),
      ),
    );
  }
