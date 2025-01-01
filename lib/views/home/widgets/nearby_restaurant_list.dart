import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/hooks/fetch_restaurant.dart';
import 'package:foodly/models/restaurants_model.dart';
import 'package:foodly/shimmers/nearby_shimmer.dart';
import 'package:foodly/views/home/widgets/restaurant_list_widget.dart';

class NearbyRestaurantList extends HookWidget {
  const NearbyRestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants('41007428');
    List<RestaurantsModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;

    return isLoading
        ? const NearbyShimmer()
        : Container(
            height: 190.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                restaurants!.length,
                (i) {
                  RestaurantsModel restaurant = restaurants[i];
                  return RestaurantListWidget(
                    image: restaurant.imageUrl,
                    logo: restaurant.logoUrl,
                    title: restaurant.title,
                    time: restaurant.time,
                    rating: restaurant.ratingCount,
                  );
                },
              ),
            ),
          );
  }
}
