import 'package:flutter/material.dart';
import 'package:ican_to/features/aboutUs/widgets/custom_question_section.dart';

class AboutDevelopersViewBody extends StatelessWidget {
  const AboutDevelopersViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Icon(
          Icons.terminal_rounded,
          size: 100,
          color: Color(0xff3CC563),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomQuestionSection(
          questionHead: "Who are the members of the development team ?",
          questionAnswer:
              "Our development team consists of [Ahmed Awad  , Mohamed Fawzi , Osama Rezk , Ahmed Kalash , Yousif Mohsen , Omar Elmadbouly ]. Each member brings a unique set of skills and expertise to the project, including software development, user experience design, and machine learning.",
        ),
        CustomQuestionSection(
          imagePath: "assets/images/flutter-icon.png",
          questionHead: "which technology we use in mobile developing ?",
          questionAnswer:
              "Eng / Mohamed Fawzi - Eng / Ahmed Awad \nFor our mobile development, we used Flutter, a popular cross-platform framework developed by Google. Flutter allowed us to build our application for both Android and iOS platforms using a single codebase, saving us time and effort in development.Flutter provides a rich set of pre-built UI widgets and a reactive framework that enabled us to create a visually appealing and responsive user interface. We leveraged Flutter's hot reload feature, which facilitated rapid iteration and made the development process efficient.Additionally, Flutter's performance was impressive, providing a smooth and native-like experience to our users. The framework's use of Dart as the programming language offered a familiar and expressive syntax, making it easier for our team to write clean and maintainable code.With Flutter, we were able to access a wide range of third-party packages from the Flutter ecosystem, which helped us integrate various functionalities into our application seamlessly. These packages allowed us to incorporate features such as camera access for capturing sign language gestures, integration with APIs for language translation, and more.Overall, Flutter proved to be an excellent choice for our mobile development needs, enabling us to create a high-quality, cross-platform sign language translator application efficiently.",
        ),
        CustomQuestionSection(
          questionHead: "which technology we use in machine learning field ?",
          questionAnswer: "",
        ),
        CustomQuestionSection(
          questionHead: "which technology we use in Front-end Developing ?",
          questionAnswer: "",
        ),
        CustomQuestionSection(
          questionHead: "which technology we use in Back-end Developing ?",
          questionAnswer: "",
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
