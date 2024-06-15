import 'package:flutter/material.dart';
import 'package:ican_to/features/aboutUs/widgets/custom_question_section.dart';

class AboutProgramViewBody extends StatelessWidget {
  const AboutProgramViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
            height: 100,
            width: 100,
            child: Image(
              image: AssetImage(
                "assets/images/logo1 1.png",
              ),
              fit: BoxFit.scaleDown,
            )),
        const SizedBox(
          height: 10,
        ),
        CustomQuestionSection(
          questionHead:
              "What is the inspiration behind creating this sign language translator program?",
          questionAnswer:
              "Our team was inspired by the desire to bridge the communication gap between the hearing-impaired community and the rest of the world. We recognized the need for an accurate and reliable sign language translator that could facilitate effective communication.",
        ),
        CustomQuestionSection(
          questionHead:
              "What motivated the team to choose sign language translation as their graduation project?",
          questionAnswer:
              "We were passionate about leveraging technology to make a positive impact on society. Sign language translation is an important area where technology can play a crucial role in enhancing communication and inclusivity. We wanted to contribute to the development of a solution that could empower the deaf community.",
        ),
        CustomQuestionSection(
          questionHead:
              "How does the sign language translator work? Provide a brief overview of the technology or algorithms used?",
          questionAnswer:
              "Our sign language translator combines computer vision and machine learning techniques. It utilizes a deep learning model trained on a large dataset of sign language gestures to recognize and interpret the user's signs. The captured video input is processed in real-time to generate accurate and instantaneous translations.",
        ),
        CustomQuestionSection(
          questionHead:
              "How accurate and reliable is the sign language translation provided by the program?",
          questionAnswer:
              "We have achieved a high level of accuracy in our sign language translation. However, it's important to note that sign language is a complex and nuanced form of communication, and there might be occasional instances where the translation may not perfectly capture every subtlety. We continuously strive to improve the accuracy and reliability of our program through user feedback and ongoing development efforts.",
        ),
        const Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            "To Know More Contact Us.",
            style: TextStyle(
                color: Color(0xff3CC563),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
