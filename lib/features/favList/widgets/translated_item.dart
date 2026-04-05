<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:ican_to/features/favList/data/models/translated_item_model.dart';
=======
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Home/data/models/translated_item_model.dart';
import 'package:ican_to/features/Home/manager/cubit/delet_item_form_fav_list_cubit.dart';
import 'package:ican_to/features/Home/presintation/functions/convert_en_to_ar.dart';
import 'package:ican_to/features/favList/manager/cubit/fetch_favorit_list_cubit.dart';
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)

class TranlatedItem extends StatelessWidget {
  const TranlatedItem({
    super.key,
    required this.translatedItemModel,
  });
  final TranslatedItemModel translatedItemModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: const BoxDecoration(
            color: Color(0xffE0EBFF),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
<<<<<<< HEAD
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(
                        translatedItemModel.translationImage,
                      ),
                      fit: BoxFit.fill,
                    ),
                  )),
=======
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: translatedItemModel.translationImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
<<<<<<< HEAD
                  translatedItemModel.translationText,
=======
                  convertingEnToAr(translatedItemModel.translationText),
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              Column(
                children: [
<<<<<<< HEAD
                  const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: InkWell(
                      child: Icon(
=======
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<DeletItemFormFavListCubit>(context)
                            .deletItemFromList(
                                translatedItemModel.translationImage);
                      },
                      child: const Icon(
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
                        Icons.delete,
                        size: 55,
                        color: Color.fromARGB(255, 105, 150, 235),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Date : ${translatedItemModel.date}",
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
