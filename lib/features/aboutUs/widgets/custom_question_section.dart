import 'package:flutter/material.dart';

class CustomQuestionSection extends StatelessWidget {
  CustomQuestionSection(
      {super.key,
      required this.questionHead,
      required this.questionAnswer,
      this.imagePath});
  final String questionHead;
  final String questionAnswer;
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  questionHead,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              QuestionIcon(
                imagePath: imagePath,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              questionAnswer,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(),
        ],
      ),
    );
  }
}

class QuestionIcon extends StatelessWidget {
  QuestionIcon({super.key, this.imagePath});
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return imagePath == null
        ? SizedBox(
            width: MediaQuery.of(context).size.width * 0.12,
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width * 0.12,
            child: Image.asset(
              imagePath!,
              fit: BoxFit.fitWidth,
            ),
          );
  }
}
