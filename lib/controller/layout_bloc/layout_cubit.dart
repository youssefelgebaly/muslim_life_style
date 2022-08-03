import 'package:adhan/adhan.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutStatesInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  Location location = Location();
  LocationData? locationData;
  Coordinates? myCoordinates;
  CalculationParameters? params;
  PrayerTimes? prayerTimes;

  determinePosition() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    myCoordinates = Coordinates(
      locationData!.latitude!,
      locationData!.longitude!,
    ); // Replace with your own location lat, lng.
    params = CalculationMethod.egyptian.getParameters();

    params!.madhab = Madhab.shafi;
    prayerTimes = PrayerTimes.today(myCoordinates!, params!);
    print(locationData);
    emit(GetLocation());
  }

  String? getPrayerName() {
    switch (prayerTimes!.nextPrayer().name) {
      case 'fajr':
        return 'الفجر';
      case 'sunrise':
        return 'الشروق';
      case 'dhuhr':
        return 'الظهر';
      case 'asr':
        return 'العصر';
     case 'maghrib':
        return 'المغرب';
      case 'isha':
        return 'العشاء';
      case 'none':
      default:
        return null;

    }
  }

  DateTime? getPrayer() {
    switch (prayerTimes!.nextPrayer().name) {
      case 'fajr':
        return prayerTimes!.timeForPrayer(Prayer.fajr);
      case 'sunrise':
        return prayerTimes!.timeForPrayer(Prayer.sunrise);
      case 'dhuhr':
        return prayerTimes!.timeForPrayer(Prayer.dhuhr);
      case 'asr':
        return prayerTimes!.timeForPrayer(Prayer.asr);
      case 'maghrib':
        return prayerTimes!.timeForPrayer(Prayer.maghrib);
      case 'isha':
        return prayerTimes!.timeForPrayer(Prayer.isha);
      case 'none':
      default:
        return null;

    }
  }
}