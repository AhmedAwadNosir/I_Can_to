import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ican_to/features/Authentication/functions/show_snack_bar.dart';
import 'package:ican_to/features/Home/manager/add_to_favorite/add_to_favorite_cubit.dart';
import 'package:ican_to/features/Home/manager/translate_from_sign_language/translate_from_sign_language_cubit.dart';
import 'package:ican_to/features/Home/presintation/functions/convert_en_to_ar.dart';
import 'package:ican_to/features/Home/presintation/functions/upload_translated_Photo.dart';
import 'package:ican_to/features/Home/presintation/widgets/colored_text.dart';
import 'package:ican_to/features/Home/presintation/widgets/uploading_image_section.dart';
import 'package:image_picker/image_picker.dart';

class FromSignLanguagebody extends StatefulWidget {
  FromSignLanguagebody({super.key, this.answer});
  String? answer;
  @override
  State<FromSignLanguagebody> createState() => _FromSignLanguagebodyState();
}

class _FromSignLanguagebodyState extends State<FromSignLanguagebody> {
  File? image;
  final imagePiker = ImagePicker();
  uploadeImage() async {
    var pikedImage = await imagePiker.pickImage(source: ImageSource.gallery);
    if (pikedImage != null) {
      setState(() {
        image = File(pikedImage.path);
      });
    } else {}
  }

  takeImage() async {
    var pikedImage = await imagePiker.pickImage(source: ImageSource.camera);
    if (pikedImage != null) {
      setState(() {
        image = File(pikedImage.path);
      });
    } else {}
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  String translatedImageUrl = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        const ColoredTextSection(),
        const SizedBox(
          height: 90,
        ),
        Column(
          children: [
            UpLoadingImageSection(
              image: image,
              picImage: uploadeImage,
              takeImage: takeImage,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
                child: Center(
                  child: SelectableText(
                    (widget.answer == "" || widget.answer == null)
                        ? "Your Translation Will Appear Here.."
                        : convertingEnToAr(widget.answer!),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 100),
        (image != null && (widget.answer != null && widget.answer != ""))
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 170,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.answer = null;
                            image = null;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(const Color(0xff3CC563)),
                          minimumSize: WidgetStateProperty.all<Size>(
                              const Size(300, 50)),
                        ),
                        child: const Text(
                          "Reset",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    width: 170,
                    child: ElevatedButton(
                        onPressed: () async {
                          User? user = auth.currentUser;
                          if (user != null) {
                            translatedImageUrl =
                                await uploadTranslatedPhoto(image);
                            setState(() {});
                            BlocProvider.of<AddToFavoriteCubit>(context)
                                .AddToFavoritList(
                                    transledImage: translatedImageUrl,
                                    translationResult: widget.answer!,
                                    translationType: "From Sign Language");
                          } else {
                            showSnackBar(
                                "Go to home page and go to sing in", context);
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(const Color(0xff3CC563)),
                          minimumSize: WidgetStateProperty.all<Size>(
                              const Size(300, 50)),
                        ),
                        child: const Text(
                          "Add To Favorit",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ),
                ],
              )
            : const SizedBox(),
        const Spacer(),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(const Color(0xff3CC563)),
              minimumSize: WidgetStateProperty.all<Size>(const Size(300, 50)),
            ),
            onPressed: () async {
              if (image != null) {
                BlocProvider.of<TranslateFromSignLanguageCubit>(context)
                    .translateFromSignLanguage(imagePath: image!.path);
              } else {
                showSnackBar("Please choose photo to translate", context);
              }
            },
            child: const Text(
              "Translate",
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}




//////////////////////////////////////////////////////////////////////////////
//      var request = http.MultipartRequest(
                //   'POST',
                //   Uri.parse("https://8dfc-41-236-132-46.ngrok-free.app/upload"),
                // );

                // String mimeType = 'image/jpeg'; // Replace with the appropriate MIME type for your image file
                // var multipartFile = await http.MultipartFile.fromPath(
                //   'frame',
                //   image!.path,
                //   contentType: MediaType('image', 'jpeg'),
                // );

                // request.files.add(multipartFile);

                // http.StreamedResponse response = await request.send();

                // print(response);
                // try {
                //   log(image!.path);
                //   log(image!.path.split('/').last);
                //   FormData formData = FormData.fromMap({
                //     "frame": MultipartFile.fromFile(image!.path,
                //         filename: image!.path.split('/').last)
                //   });
                //   ApiServices apiServices = ApiServices(dio: Dio());

                //   var response = await apiServices.post(
                //     endPoint: "/upload",
                //     body: formData,
                //   );
                // } catch (e) {
                //   log(e.toString());
                // }
                  // BlocProvider.of<TranslateFromSignLanguageCubit>(context)
                //     .translateFromSignLanguage(imagePath: image!.path);
                ///////////////////////////////////////////////////////////
                // http.Response response = await http.post(
                //     Uri.parse(
                //         "https://8dfc-41-236-132-46.ngrok-free.app/upload"),
                //     body: {
                //       "frame": MultipartFile.fromFile(image!.path,
                //           filename: image!.path.split('/').last)
                //     });
                /////////////////////////////////////////////////////////////
// Replace the body parameter in your http.post method with a Map<String, String>
