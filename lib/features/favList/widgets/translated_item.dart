import 'package:flutter/material.dart';
import 'package:ican_to/features/favList/data/models/translated_item_model.dart';

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
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  translatedItemModel.translationText,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: InkWell(
                      child: Icon(
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
