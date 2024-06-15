import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_images.dart';

import 'package:ican_to/features/favList/data/models/translated_item_model.dart';
import 'package:ican_to/features/favList/widgets/translated_item.dart';

class FavListViewBuilder extends StatelessWidget {
  const FavListViewBuilder({
    super.key,
    required this.favList,
  });

  final List<TranslatedItemModel> favList;

  @override
  Widget build(BuildContext context) {
    return favList.isEmpty
        ? Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(image: AssetImage(AppImages.emptyListImage)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text.rich(
                    TextSpan(
                      text: 'please add some words to your',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Fav List ',
                          style: TextStyle(
                              color: Color(0xff3CC563),
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                        TextSpan(
                          text: '!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: const Text(
                    "So you can retrieve it faster.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
              ],
            ),
          )
        : Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: favList.length,
                itemBuilder: (context, index) {
                  return TranlatedItem(translatedItemModel: favList[index]);
                },
              ),
            ),
          );
  }
}
