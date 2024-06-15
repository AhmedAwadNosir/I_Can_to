import 'package:cached_network_image/cached_network_image.dart';
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

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHight * 0.36,
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
                      height: screenHight * 0.25,
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
                                "My Information",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 16),
                            CustomTextWidget(
                                text: "MyName => ${widget.userData.userName}"),
                            const SizedBox(height: 16),
                            CustomTextWidget(
                              text: "MyCountry => ${widget.userData.country}",
                            ),
                            const SizedBox(height: 16),
                            CustomTextWidget(
                              text: "MyGender => ${widget.userData.gender}",
                            ),
                            const SizedBox(height: 16),
                            CustomTextWidget(
                                text:
                                    "MyBirthdate => ${widget.userData.birthdate}"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
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
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
