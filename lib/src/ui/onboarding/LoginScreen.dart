import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../component/rounded_input_field.dart';
import '../../../res/ResColor.dart';
import '../../../res/ResString.dart';
import '../../../intro_slider/src/slide.dart';
import '../../../utils/Utils.dart';
import '../../models/CountryCodee.dart';
import '../../resources/repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  List<Slide> slides = [];
  List<CountryCode> contryCodeList = [
    CountryCode(code: "+91", image: "${imagepathstr}indiaflag.png"),
    CountryCode(code: "+1", image: "${imagepathstr}canadaflag.png"),
  ];
  String mobile = "";
  String refercode = "";
  bool isloading = false;
  late CountryCode defaultSelected;

  @override
  void initState() {
    super.initState();
    defaultSelected = contryCodeList[0];
    isLocationPermission(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
            children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 1000),
          childAnimationBuilder: (widget) => FadeInAnimation(
            child: SlideAnimation(
              child: widget,
            ),
          ),
          children: [
            Container(
              width: double.maxFinite,
              height: 430,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  gradient: const LinearGradient(colors: [
                    mainColor,
                    mainLightColor,
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    login,
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                        fontFamily: poppinsregular),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    toContinue,
                    style: TextStyle(
                        color: whiteColor,
                        fontSize: 13,
                        fontFamily: poppinsregular),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Image.asset(
                    "${imagepathstr}message.png",
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton(
                        // Initial Value
                        value: defaultSelected,
                        // Down Arrow Icon
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 22,
                          ),
                        ),
                        // Array list of items
                        underline: Container(),
                        items: contryCodeList.map((CountryCode items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Image.asset(
                              items.image.toString(),
                              width: 25,
                              height: 25,
                            ),
                          );
                        }).toList(),
                        // After selecting the desired option,it will
                        // change button value to selected value
                        onChanged: (CountryCode? newValue) {
                          print("newValuenewValue $newValue");
                          setState(() {
                            defaultSelected = newValue!;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            RoundedInputField(
                              hintText: mobilehint,
                              onChanged: (value) {
                                mobile = value.toString();
                              },
                              inputType: TextInputType.phone,
                              icon: Image.asset(
                                "${imagepathstr}ic_phone.png",
                                width: 14,
                                height: 14,
                                color: greyColor2,
                              ),
                              cornerRadius: 0,
                              horizontalmargin: 5,
                              elevations: 0,
                              borderColor: whiteColor,
                              textAlign: TextAlign.start,
                              verticalmargin: 0,
                              textsize: 14,
                              textcolor: greyColor5,
                              obscureText: false,
                              opTapField: () {},
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 2, right: 2, top: 2),
                              child: Image.asset("${imagepathstr}ic_line.png",
                                  fit: BoxFit.cover),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundedInputField(
                    hintText: redeemhint,
                    onChanged: (value) {
                      refercode = value.toString();
                    },
                    inputType: TextInputType.phone,
                    icon: Image.asset(
                      "${imagepathstr}ic_reffrel.png",
                      width: 14,
                      height: 14,
                      color: greyColor2,
                    ),
                    cornerRadius: 0,
                    horizontalmargin: 5,
                    elevations: 0,
                    borderColor: whiteColor,
                    textAlign: TextAlign.start,
                    verticalmargin: 0,
                    textsize: 14,
                    textcolor: greyColor5,
                    obscureText: false,
                    opTapField: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 2, right: 2, top: 2),
                    child: Image.asset("${imagepathstr}ic_line.png",
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  isloading == false
                      ? InkWell(
                          onTap: () async {
                            if (mobile.length != 10) {
                              ShowToast(mobilevelid, context);
                            } else {
                              setState(() {
                                isloading = true;
                              });

                              await Repository().loginapi(mobile,
                                  defaultSelected.code, refercode, context);
                              setState(() {
                                isloading = false;
                              });
                            }
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                "${imagepathstr}ylo_login.png",
                                width: 50,
                                height: 50,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                login,
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: 14,
                                    fontFamily: poppinsmedium),
                              ),
                            ],
                          ),
                        )
                      : const CircularProgressIndicator(
                          strokeWidth: 2,
                        )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
