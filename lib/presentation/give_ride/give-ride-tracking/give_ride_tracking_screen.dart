import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:share_way_frontend/core/constants/app_color.dart';
import 'package:share_way_frontend/core/constants/app_icon.dart';
import 'package:share_way_frontend/core/constants/app_text_theme.dart';
import 'package:share_way_frontend/core/utils/spaces.dart';
import 'package:share_way_frontend/core/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:share_way_frontend/core/widgets/button/app_button.dart';
import 'package:share_way_frontend/core/widgets/loading/loading_screen.dart';
import 'package:share_way_frontend/domain/map/output/hitch_ride_recommendation_ouput/hitch_ride_recommendation_ouput.dart';
import 'package:share_way_frontend/gen/assets.gen.dart';
import 'package:share_way_frontend/presentation/give_ride/give-ride-tracking/bloc/give_ride_tracking_bloc.dart';
import 'package:share_way_frontend/presentation/give_ride/give-ride-tracking/bloc/give_ride_tracking_state.dart';

class GiveRideTrackingScreen extends StatefulWidget {
  final HitchRideRecommendationOuput data;

  GiveRideTrackingScreen({super.key, required this.data});

  @override
  State createState() => GiveRideTrackingScreenState();
}

class GiveRideTrackingScreenState extends State<GiveRideTrackingScreen> {
  late GiveRideTrackingBloc bloc;
  final DraggableScrollableController _draggableScrollableController =
      DraggableScrollableController();
  final ValueNotifier<bool> _isExpanded = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    bloc = GiveRideTrackingBloc();
    _draggableScrollableController.addListener(() {
      _isExpanded.value = _draggableScrollableController.size > 0.15;
    });
  }

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..onStart(widget.data),
      child: BlocBuilder<GiveRideTrackingBloc, GiveRideTrackingState>(
        builder: (context, state) {
          if (state.currentLocation == null) {
            return LoadingScreen();
          }
          return Scaffold(
              body: Stack(
            children: [
              MapWidget(
                styleUri: MapboxStyles.MAPBOX_STREETS,
                onMapCreated: bloc.onMapCreated,
                onStyleLoadedListener: bloc.onStyleLoadedCallback,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                          flex: 0,
                          shape: BoxShape.circle,
                          icon: AppIcon.backToCurrentLocation,
                          backgroundColor: AppColor.white,
                          padding: EdgeInsets.all(8.w),
                          onPressed: () =>
                              bloc.onBackToCurrentLocation(context),
                        ),
                        spaceW8,
                      ],
                    ),
                    spaceH8,
                    _showHitcherDetailBottomSheet(),
                  ],
                ),
              ),
            ],
          ));
        },
      ),
    );
  }

  Widget _showHitcherDetailBottomSheet() {
    return BlocBuilder<GiveRideTrackingBloc, GiveRideTrackingState>(
      builder: (context, state) {
        return AppBottomSheet(
          height: 0.4.sh,
          draggableScrollableController: _draggableScrollableController,
          isExpanded: _isExpanded,
          body: [
            Column(
              children: [
                spaceH8,
                Row(
                  children: [
                    spaceW16,
                    Text(
                      'Chi tiết về chuyến đi',
                      style: textTheme.titleSmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    spaceW16,
                    Text(
                      'Vui lòng xem kỹ các thông tin về chuyến đi',
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColor.secondaryColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                spaceH8,
                _buildDivider(),
                _buildRideInfor(state),
                _buildDivider(),
              ],
            ),
            _buildContinueButton(),
          ],
        );
      },
    );
  }

  Row _buildDivider() {
    return Row(
      children: [
        spaceW16,
        const Expanded(child: Divider(color: AppColor.secondary100)),
        spaceW16,
      ],
    );
  }

  Widget _buildRideInfor(GiveRideTrackingState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Assets.images.exampleAvatar.image(),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  state.hitchRideRecommendationOuput?.user?.fullName ?? '',
                  style: textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // Flexible(
              //   child: Text(
              //     state.fareString,
              //     style: textTheme.titleSmall!.copyWith(
              //       color: AppColor.primaryColor,
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //   ),
              // ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '${state.hitchRideRecommendationOuput?.distance}km - ${state.hitchRideRecommendationOuput?.duration} phút',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColor.secondaryColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              // Flexible(
              //   child: Text(
              //     '${state.createGiveRideOutput?.vehicle}km',
              //     style: textTheme.bodyMedium!.copyWith(
              //       color: AppColor.secondaryColor,
              //       overflow: TextOverflow.ellipsis,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppButton(
          title: 'Mời đi cùng',
          onPressed: () => bloc.onSendGiveRide(context),
        ),
      ],
    );
  }
}
