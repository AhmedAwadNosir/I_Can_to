import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/features/favList/data/models/translated_item_model.dart';
import 'package:ican_to/features/favList/widgets/fav_list_view_builder.dart';

class FavListViewBody extends StatelessWidget {
  const FavListViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TranslatedItemModel> favList = [
      // TranslatedItemModel(
      //     translationImage: "assets/images/signex 1.png",
      //     translationText: "Hello",
      //     date: "1-1-2025",
      //     translationType: "From Sign Language"),
      // TranslatedItemModel(
      //     translationImage: "assets/images/signex 1.png",
      //     translationText: "Hello",
      //     date: "1-1-2025",
      //     translationType: "From Sign Language"),
      // TranslatedItemModel(
      //     translationImage: "assets/images/signex 1.png",
      //     translationText: "Hello",
      //     date: "1-1-2025",
      //     translationType: "From Sign Language"),
    ];
=======
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/features/Home/data/models/translated_item_model.dart';
import 'package:ican_to/features/favList/manager/cubit/fetch_favorit_list_cubit.dart';

import 'package:ican_to/features/favList/widgets/fav_list_view_builder.dart';

class FavListViewBody extends StatefulWidget {
  const FavListViewBody({
    super.key,
    required this.favList,
  });
  final List<TranslatedItemModel> favList;
  @override
  State<FavListViewBody> createState() => _FavListViewBodyState();
}

class _FavListViewBodyState extends State<FavListViewBody> {
  @override
  @override
  Widget build(BuildContext context) {
    //[
    //   // TranslatedItemModel(
    //   //     translationImage: "assets/images/signex 1.png",
    //   //     translationText: "Hello",
    //   //     date: "1-1-2025",
    //   //     translationType: "From Sign Language"),
    //   // TranslatedItemModel(
    //   //     translationImage: "assets/images/signex 1.png",
    //   //     translationText: "Hello",
    //   //     date: "1-1-2025",
    //   //     translationType: "From Sign Language"),
    //   // TranslatedItemModel(
    //   //     translationImage: "assets/images/signex 1.png",
    //   //     translationText: "Hello",
    //   //     date: "1-1-2025",
    //   //     translationType: "From Sign Language"),
    // ];
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Image(image: AssetImage(AppImages.homeAppLogo)),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: BorderDirectional(
                        start: BorderSide(color: Color(0xff3CC563), width: 6))),
                child: const Text(
                  " Your Fav List ",
                  style: TextStyle(
                      color: Color(0xff3CC563),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 24),
                child: Image(image: AssetImage(AppImages.heartIcon)),
              ),
            ],
          ),
        ),
<<<<<<< HEAD
        FavListViewBuilder(favList: favList),
=======
        FavListViewBuilder(favList: widget.favList),
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
      ],
    );
  }
}
