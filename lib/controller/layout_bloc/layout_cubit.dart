import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutStatesInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  Location location = Location();
  LocationData? locationData;
  determinePosition() async {


    bool serviceEnabled;
    PermissionStatus permissionGranted;


    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return ;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return ;
      }
    }

    locationData = await location.getLocation();
    print(locationData);
    emit(GetLocation());
  }
}