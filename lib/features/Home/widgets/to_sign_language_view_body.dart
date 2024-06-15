import 'dart:developer';

import 'package:flutter/material.dart';

class ToSignLanguageViewBody extends StatefulWidget {
  const ToSignLanguageViewBody({
    super.key,
  });

  @override
  State<ToSignLanguageViewBody> createState() => _ToSignLanguageViewBodyState();
}

class _ToSignLanguageViewBodyState extends State<ToSignLanguageViewBody> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: BorderDirectional(
                        start: BorderSide(color: Color(0xff3CC563), width: 6))),
                child: const Text.rich(
                  TextSpan(
                    text: ' Translate',
                    style: TextStyle(
                        color: Color(0xff3CC563),
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' To ',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: 'Sgin Language',
                        style: TextStyle(
                            color: Color(0xff3CC563),
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 110,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Some Text To Translate It !';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Type Something To Translate',
                    hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                    fillColor: Colors.transparent,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  // translation image or video
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.fromBorderSide(
                      BorderSide(
                        width: 1,
                      ),
                    ),
                  ),
                  // translation image or video
                  child: const Icon(
                    Icons.image,
                    size: 100,
                    color: Color(0xff3CC563),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 110,
        ),
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(const Color(0xff3CC563)),
              minimumSize: WidgetStateProperty.all<Size>(const Size(300, 50)),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                log("validate input");
              }
            },
            child: const Text(
              "Translate",
              style: TextStyle(color: Colors.white, fontSize: 24),
            )),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
