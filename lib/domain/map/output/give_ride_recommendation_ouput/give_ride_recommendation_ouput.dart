import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/data/api/map/response/suggest_give_riders_response/suggest_give_riders_ride_offer_response.dart';
import 'package:share_way_frontend/domain/shared/models/geocode.dart';
import 'package:share_way_frontend/domain/user/output/app_user.dart';
import 'package:share_way_frontend/domain/vehicle/output/get_vehicle_ouput.dart';
part 'give_ride_recommendation_ouput.g.dart';

@CopyWith()
class GiveRideRecommendationOuput {
  final String? giveRideId;
  final int? distance;
  final int? duration;
  final double? fare;
  final String? polyline;
  final Geocode? startLocation;
  final Geocode? endLocation;
  final DateTime? startTime;
  final DateTime? endTime;
  final AppUser? user;
  final GetVehicleOuput? vehicle;
  final String? hitchRideId;

  GiveRideRecommendationOuput({
    this.giveRideId,
    this.distance,
    this.duration,
    this.fare,
    this.polyline,
    this.startLocation,
    this.endLocation,
    this.startTime,
    this.endTime,
    this.user,
    this.vehicle,
    this.hitchRideId,
  });

  factory GiveRideRecommendationOuput.fromApiModel(
      SuggestGiveRidersRideOfferResponse response) {
    return GiveRideRecommendationOuput(
      giveRideId: response.rideOfferId,
      distance: response.distance,
      duration: (response.duration != null)
          ? response.duration! ~/ 60 + (response.duration! % 60 == 0 ? 0 : 1)
          : null,
      polyline: response.encodedPolyline,
      startLocation: Geocode(
        latitude: response.startLatitude ?? 0.0,
        longitude: response.startLongitude ?? 0.0,
      ),
      endLocation: Geocode(
        latitude: response.endLatitude ?? 0.0,
        longitude: response.endLongitude ?? 0.0,
      ),
      startTime: response.startTime,
      endTime: response.endTime,
      user: AppUser(
        id: response.user?.userId,
        fullName: response.user?.fullName,
        phoneNumber: response.user?.phoneNumber,
      ),
      vehicle: GetVehicleOuput(
        vehicleId: response.vehicle?.vehicleId,
        name: response.vehicle?.name,
        fuelConsumed: response.vehicle?.fuelConsumed,
        licensePlate: response.vehicle?.licensePlate,
      ),
      fare: response.fare,
    );
  }
}
