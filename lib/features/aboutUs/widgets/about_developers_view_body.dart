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
          imagePath: "lib/core/utils/assets/images/flutter-icon.png",
          questionHead: "which technology we use in mobile developing ?",
          questionAnswer:
              "Eng / Mohamed Fawzi - Eng / Ahmed Awad \nFor our mobile development, we used Flutter, a popular cross-platform framework developed by Google. Flutter allowed us to build our application for both Android and iOS platforms using a single codebase, saving us time and effort in development.Flutter provides a rich set of pre-built UI widgets and a reactive framework that enabled us to create a visually appealing and responsive user interface. We leveraged Flutter's hot reload feature, which facilitated rapid iteration and made the development process efficient.Additionally, Flutter's performance was impressive, providing a smooth and native-like experience to our users. The framework's use of Dart as the programming language offered a familiar and expressive syntax, making it easier for our team to write clean and maintainable code.With Flutter, we were able to access a wide range of third-party packages from the Flutter ecosystem, which helped us integrate various functionalities into our application seamlessly. These packages allowed us to incorporate features such as camera access for capturing sign language gestures, integration with APIs for language translation, and more.Overall, Flutter proved to be an excellent choice for our mobile development needs, enabling us to create a high-quality, cross-platform sign language translator application efficiently.",
        ),
        CustomQuestionSection(
          imagePath: "lib/core/utils/assets/images/python-logo.png",
          questionHead: "which technology we use in machine learning field ?",
          questionAnswer:
              "Python served as the primary programming language for our project. Python is widely used in the field of machine learning and provides a rich ecosystem of libraries and frameworks that make it easier to develop ML applications. We leveraged Python's simplicity, readability, and extensive ML libraries to implement our sign language translator.\nFlask, a web framework for Python, played a crucial role in building the user interface and creating an accessible platform for our sign language translator. We used Flask to handle HTTP requests and responses, render web pages, and interact with our ML model. Flask allowed us to create a user-friendly interface where users could input sign language gestures and receive translations in real-time.\nTo detect and recognize sign language gestures, we incorporated the YOLO object detection framework. YOLO is a popular deep learning algorithm that can detect and classify objects in images and videos with impressive speed and accuracy. By training YOLO on a dataset of sign language gestures, we taught it to recognize various hand shapes and movements associated with different signs.",
        ),
        CustomQuestionSection(
          questionHead: "which technology we use in Front-end Developing ?",
          questionAnswer:
              "HTML (Hypertext Markup Language) provided the structure and layout for our web pages. We used HTML to create the different components of our user interface, such as input fields, buttons, and containers. It allowed us to define the overall structure of the application and organize the content in a logical manner.\nCSS (Cascading Style Sheets) played a crucial role in the design and styling of our application. We utilized CSS to apply visual properties such as colors, fonts, spacing, and positioning to the HTML elements. This allowed us to create an aesthetically pleasing and consistent user interface, enhancing the overall user experience.\nJavaScript was employed for the dynamic and interactive aspects of our sign language translator. We used JavaScript to implement functionality like capturing user input, handling user interactions, and updating the interface in real-time. Additionally, JavaScript enabled us to incorporate animations, transitions, and other interactive elements to enhance the user interface and make it more engaging.",
        ),
        CustomQuestionSection(
          imagePath: "lib/core/utils/assets/images/laravel.jpeg",
          questionHead: "which technology we use in Back-end Developing ?",
          questionAnswer:
              "Laravel, a powerful PHP framework, played a crucial role in structuring and organizing our back-end codebase. It provided a robust set of tools and features for building scalable and maintainable web applications. Laravel's MVC (Model-View-Controller) architecture allowed us to separate concerns, making our code more modular and easier to manage. It also provided features like routing, database migration, and ORM (Object-Relational Mapping) for efficient database interactions.\nFirebase, a cloud-based development platform, served as our database and backend-as-a-service solution. We leveraged Firebase's Realtime Database or Firestore to store and retrieve data related to sign language translations, user profiles, and other application-specific information. Firebase's real-time capabilities enabled us to synchronize data across devices and provide seamless updates to the user interface.",
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
