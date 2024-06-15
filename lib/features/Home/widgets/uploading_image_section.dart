import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ican_to/core/utils/app_images.dart';
import 'package:image_picker/image_picker.dart';

class UpLoadingImageSection extends StatefulWidget {
  const UpLoadingImageSection({
    super.key,
  });

  @override
  State<UpLoadingImageSection> createState() => _UpLoadingImageSectionState();
}

class _UpLoadingImageSectionState extends State<UpLoadingImageSection> {
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

  @override
  Widget build(BuildContext context) {
    return image == null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              // translation image or video
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: Colors.white,
                    width: 1,
                  ),
                ),
              ),
              // translation image or video
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Image(
                    image: AssetImage(AppImages.uploadIcon),
                  ),
                  const Text(
                    "Upload Image/Video",
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text("Max. file size 10 MB"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: takeImage,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera,
                                color: Color(0xff3CC563),
                              ),
                              Text(
                                " Take Image",
                                style: TextStyle(color: Color(0xff3CC563)),
                              ),
                            ],
                          )),
                      ElevatedButton(
                          onPressed: uploadeImage,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload_rounded,
                                color: Color(0xff3CC563),
                              ),
                              Text(
                                "Add File",
                                style: TextStyle(color: Color(0xff3CC563)),
                              )
                            ],
                          )),
                    ],
                  )
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                ),
                child: Image.file(
                  image!,
                  fit: BoxFit.cover,
                )),
          );
  }
}
