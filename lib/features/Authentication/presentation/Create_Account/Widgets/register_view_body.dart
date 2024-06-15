import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/core/utils/app_colors.dart';
import 'package:ican_to/core/utils/app_fonts_styles.dart';
import 'package:ican_to/features/Authentication/data/Models/user_data_model.dart';
import 'package:ican_to/features/Authentication/functions/show_snack_bar.dart';
import 'package:ican_to/features/Authentication/presentation/Sign_IN/Views/sign_in_view.dart';
import 'package:ican_to/features/Authentication/presentation/Widgets/page_initail_info.dart';
import 'package:ican_to/features/Authentication/presentation/Widgets/user_instractions.dart';
import 'package:ican_to/features/Authentication/states_manager/Cubits/Register/register_cubit.dart';
import 'package:ican_to/features/Onboarding/presentation/Widgets/custom_button.dart';
import 'package:iconsax/iconsax.dart';
import '../../Widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:country_picker/country_picker.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late String userNameData = '';
  late String passwordData = '';
  late String emialData = '';
  String userCountry = "Country/Region";
  String birthdate = "Birthdate";
  DateTime dateTime = DateTime.now();
  var items = ["male", "female"];
  String? selectedGender;
  bool changeHelperStyleColor = false;
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 39),
              const PageInitialinfo(
                pagegole: "Cereate Account",
                pagegoledefination: "Please create an account",
              ),
              const SizedBox(height: 44),
              CustomTextFormField(
                contentPading: 19,
                hintText: 'Username',
                autovalidateMode: autovalidateMode,
                prefixicon: const Icon(
                  Iconsax.user_square,
                ),
                obscureText: false,
                onChanged: (value) {
                  setState(() {
                    userNameData = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    userNameData = value!;
                  });
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Field is Required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () =>
                    showSheet(context, child: buildDatePicker(), onpress: () {
                  setState(() {
                    birthdate = DateFormat('yyyy/MM/dd').format(dateTime);
                    print(birthdate);
                  });
                  Navigator.pop(context);
                }),
                child: CustomDataFieldContainer(
                  screenWidth: screenWidth,
                  dataField: birthdate,
                  hintText: "Birthdate",
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      exclude: <String>['KN', 'MF'],
                      favorite: <String>['SE'],
                      showPhoneCode: true,
                      onSelect: (Country country) {
                        setState(() {
                          userCountry =
                              country.toString().split(" ")[3].split(")")[0];
                        });
                        print('Select country: ${userCountry}');
                      },
                      countryListTheme: CountryListThemeData(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                        // Optional. Styles the search field.
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8).withOpacity(0.2),
                            ),
                          ),
                        ),
                        searchTextStyle: const TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                        ),
                      ),
                    );
                  },
                  child: CustomDataFieldContainer(
                      screenWidth: screenWidth,
                      dataField: userCountry,
                      hintText: "Country/Region")),
              const SizedBox(height: 16),
              Container(
                height: 58,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.appNeutralColors300),
                    color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedGender,
                    isExpanded: true,
                    iconSize: 36,
                    hint: Text("gender"),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (value) => setState(() {
                      selectedGender = value;
                      log(selectedGender ?? "");
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                contentPading: 19,
                hintText: 'Email',
                autovalidateMode: autovalidateMode,
                prefixicon: const Icon(
                  Iconsax.sms,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Field is Required";
                  }
                  return null;
                },
                obscureText: false,
                onChanged: (value) {
                  setState(() {
                    emialData = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    emialData = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                contentPading: 19,
                hintText: "Password",
                prefixicon: const Icon(Iconsax.lock),
                suffixicon: const Icon(Iconsax.eye_slash),
                helperText: "Password must be at least 8 characters",
                helperStyle: AppFontsStyles.textstyle16.copyWith(
                    color: changeHelperStyleColor
                        ? AppColors.appSuccessColors500
                        : AppColors.appNeutralColors400),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  setState(() {
                    passwordData = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    passwordData = value!;
                  });
                },
                validator: (value) {
                  changeHelperStyleColor = true;
                  if (value!.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 45),
              ),
              UserInstractions(
                userDestenation: "Login",
                onTap: () {
                  Navigator.pushReplacementNamed(context, SignInView.id);
                },
                userQution: "Already have an account?",
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    if (passwordData.isNotEmpty &&
                        emialData.isNotEmpty &&
                        userNameData.isNotEmpty &&
                        selectedGender != null &&
                        birthdate != "Birthdate" &&
                        userCountry != "Country/Region") {
                      BlocProvider.of<RegisterCubit>(context)
                          .registerWithEmailAndPassword(
                        userModel: UserModel(
                          userName: userNameData.trim(),
                          email: emialData,
                          birthdate: birthdate,
                          country: userCountry,
                          gender: selectedGender,
                          userPhoto: selectedGender == "male"
                              ? "https://firebasestorage.googleapis.com/v0/b/icanto-c57bd.appspot.com/o/user_profile_defult_photo%2Fp2.jpg?alt=media&token=f08cfd65-67b0-45bb-b831-94c972b6f871"
                              : "https://firebasestorage.googleapis.com/v0/b/icanto-c57bd.appspot.com/o/user_profile_defult_photo%2Fp1.jpg?alt=media&token=c00f4a8f-f649-48ec-bb69-9c3e09f62722",
                          bio: "hello i use Ican to its amazing app",
                        ),
                        password: passwordData,
                      );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                      showSnackBar(
                          "PLease Complete Your Account Data!", context);
                    }
                    // await BlocProvider.of<RegisterApiCubit>(context)
                    //     .registerApi(
                    //         userName: userNameData,
                    //         email: emialData,
                    //         password: passwordData);
                  }
                },
                buttonName: "Create account",
                buttonColor: (passwordData.isNotEmpty &&
                        emialData.isNotEmpty &&
                        userNameData.isNotEmpty &&
                        selectedGender != null &&
                        birthdate != "Birthdate" &&
                        userCountry != "Country/Region")
                    ? AppColors.appPrimaryColors500
                    : AppColors.appNeutralColors300,
                textButtonColor: (passwordData.isNotEmpty &&
                        emialData.isNotEmpty &&
                        userNameData.isNotEmpty &&
                        selectedGender != null &&
                        birthdate != "Birthdate" &&
                        userCountry != "Country/Region")
                    ? Colors.white
                    : AppColors.appNeutralColors400,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          maximumYear: DateTime.now().year,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (value) => setState(
            () => dateTime = value,
          ),
        ),
      );

  static void showSheet(BuildContext context,
          {required Widget child, required VoidCallback onpress}) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            actions: [child],
            cancelButton: CupertinoActionSheetAction(
                onPressed: onpress,
                child: const Text(
                  "confirm",
                  style: TextStyle(color: Colors.green),
                )),
          );
        },
      );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      );
}

class CustomDataFieldContainer extends StatelessWidget {
  const CustomDataFieldContainer({
    super.key,
    required this.screenWidth,
    required this.dataField,
    required this.hintText,
  });

  final double screenWidth;
  final String dataField;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 58,
        width: screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
                color: dataField == hintText
                    ? AppColors.appNeutralColors300
                    : AppColors.appPrimaryColors500)),
        child: Row(
          children: [
            Icon(
              Icons.date_range,
              color: dataField == hintText
                  ? AppColors.appNeutralColors300
                  : Colors.black,
            ),
            SizedBox(width: 12),
            Text(
              // "2002-08-27",
              dataField,
              style: TextStyle(
                fontSize: 16,
                color: dataField == hintText
                    ? AppColors.appNeutralColors300
                    : Colors.black,
              ),
            ),
          ],
        ));
  }
}
