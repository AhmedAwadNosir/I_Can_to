import 'package:cached_network_image/cached_network_image.dart';
<<<<<<< HEAD
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/core/utils/app_colors.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
import 'package:ican_to/features/profile/functions/calculate_user_age.dart';
import 'package:ican_to/features/profile/functions/get_current_user_profile.dart';
import 'package:ican_to/features/profile/presentation/views/modify_user_data_view.dart';
import 'package:ican_to/features/profile/presentation/widgets/age_card.dart';
import 'package:ican_to/features/profile/presentation/widgets/modefiy_user_data_view_body.dart';
=======
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:ican_to/core/utils/constans.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
import 'package:ican_to/features/Authentication/functions/show_snack_bar.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/sign_in_view.dart';
import 'package:ican_to/features/profile/presentation/views/modify_user_data_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key, required this.userData});
  final UserModel userData;
  @override
  // ignore: library_private_types_in_public_api
  _ProfileViewBody createState() => _ProfileViewBody();
}

class _ProfileViewBody extends State<ProfileViewBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final double screenHight = MediaQuery.of(context).size.height;
<<<<<<< HEAD

=======
    final FirebaseAuth auth = FirebaseAuth.instance;
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
    return Scaffold(
      body: Stack(
        children: [
          Container(
<<<<<<< HEAD
            height: screenHight * 0.36,
=======
            height: screenHight * 0.4,
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    AppImages.profileBackgroun), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ModifyUserDataView(
                                userData: widget.userData);
                          },
                        ));
                      });
                    },
                    icon: const Icon(
                      Icons.edit_calendar,
                      size: 30,
                      color: Colors.white,
                    ))
              ],
            ),
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 35, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 15),
                        child: CircleAvatar(
                          radius: 73,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                widget.userData.userPhoto ?? ""),
                            radius: 70,
                          ),
                        ),
                      ),
                      Text(
                        widget.userData.userName ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHight * 0.361),
            child: Container(
              height: screenHight * 0.6,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 35),
                    Container(
                      width: double.infinity,
<<<<<<< HEAD
                      height: screenHight * 0.25,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3))
                      ]),
=======
                      height: screenHight * 0.13,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: []),
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            const Center(
                              child: Text(
<<<<<<< HEAD
                                "My Information",
=======
                                "Bio",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomTextWidget(text: "${widget.userData.bio}"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: screenHight * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            const Center(
                              child: Text(
                                "User Info",
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomTextWidget(
<<<<<<< HEAD
                                text: "MyName => ${widget.userData.userName}"),
                            const SizedBox(height: 16),
                            CustomTextWidget(
                              text: "MyCountry => ${widget.userData.country}",
                            ),
                            const SizedBox(height: 16),
                            CustomTextWidget(
                              text: "MyGender => ${widget.userData.gender}",
=======
                                text:
                                    "User Name : ${widget.userData.userName}"),
                            const SizedBox(height: 16),
                            CustomTextWidget(
                              text:
                                  "User Country :  ${widget.userData.country}",
                            ),
                            const SizedBox(height: 16),
                            CustomTextWidget(
                              text: "User Gender : ${widget.userData.gender}",
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
                            ),
                            const SizedBox(height: 16),
                            CustomTextWidget(
                                text:
<<<<<<< HEAD
                                    "MyBirthdate => ${widget.userData.birthdate}"),
=======
                                    "Birthdate : ${widget.userData.birthdate}"),
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
<<<<<<< HEAD
                    Container(
                      width: double.infinity,
                      height: screenHight * 0.2,
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3))
                      ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            const Center(
                              child: Text(
                                "Who I Am?",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomTextWidget(
                                text: "I Am => ${widget.userData.bio}"),
                          ],
                        ),
                      ),
                    )
=======
                    (auth.currentUser != null)
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff3CC563)),
                            onPressed: () async {
                              try {
                                await auth.signOut();
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.remove(isLogin);
                                Navigator.pushReplacementNamed(
                                    context, SignInView.id);
                              } catch (e) {
                                showSnackBar(
                                    "somthing wrong has habend with message ${e.toString()}? please check your internet conection!",
                                    context);
                              }
                            },
                            child: const Text(
                              "Log Out",
                              style: TextStyle(color: Colors.white),
                            ))
                        : const SizedBox()
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
<<<<<<< HEAD
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
=======
      style: const TextStyle(fontSize: 18),
>>>>>>> f0e6fff (Update project with new version when modify repostry redmi)
    );
  }
}
