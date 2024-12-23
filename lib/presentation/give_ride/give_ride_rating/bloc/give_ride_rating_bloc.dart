import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_way_frontend/core/widgets/snackbar/snackbar.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/domain/ride/input/rating_hitcher_input.dart';
import 'package:share_way_frontend/domain/ride/ride_repository.dart';
import 'package:share_way_frontend/presentation/give_ride/give_ride_rating/bloc/give_ride_rating_state.dart';
import 'package:share_way_frontend/router/app_path.dart';

class GiveRideRatingBloc extends Cubit<GiveRideRatingState> {
  GiveRideRatingBloc({required this.data}) : super(GiveRideRatingState());

  final _rideRepository = RideRepository();
  final HitchRideRecommendationOuput data;

  void onStart() {
    emit(state.copyWith(isLoading: true));
    try {} catch (e) {
      // TODO: Add onboarding logic
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void onChangeRating(int value) {
    emit(state.copyWith(star: value == state.star ? null : value));
  }

  void onChangeFeedback(String? value) {
    emit(state.copyWith(feedback: value));
  }

  void onSendFeedback(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    try {
      final input = RatingHitcherInput(
        rating: state.star,
        receiverId: data.user?.id,
        review: state.feedback ?? '',
        rideId: data.rideId,
      );
      final response = await _rideRepository.ratingRideHitcher(input);
      if (response) {
        GoRouter.of(context).go(AppPath.home);
      }
    } catch (e) {
      showErrorSnackbar(context, 'Đã có lỗi xảy ra');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
