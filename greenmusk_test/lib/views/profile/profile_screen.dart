import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenmusk_test/core/constants/app_text_styles.dart';
import 'package:greenmusk_test/core/global_widgets/custom_chips.dart';
import 'package:greenmusk_test/core/global_widgets/custom_text_form_field.dart';
import 'package:greenmusk_test/core/helpers/enum_converter_extension.dart';
import 'package:greenmusk_test/models/language_model.dart';
import 'package:greenmusk_test/models/skill_model.dart';

import '../../../core/constants/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String skillAddedMessage = "Skill has been added, add another one.";
  final String languageAddedMessage = "Skill has been added, add another one.";

  bool isSkillAddedSuccess = false;
  bool isLanguageAddedSuccess = false;

  late final TextEditingController linkedinController;
  late final TextEditingController skillAndLanguageController;

  // Skill level selection
  late List<bool> isSelected;

  late List<SkillModel> skills;

  late List<LanguageModel> languages;

  @override
  void initState() {
    super.initState();
    linkedinController = TextEditingController();
    skillAndLanguageController = TextEditingController();

    isSelected = [false, false, false, false, false];

    skills = [SkillModel(skillName: "Add New Skill", skillLevel: 0)];
    languages = [LanguageModel(languageName: "Add New Language")];
  }

  @override
  void dispose() {
    linkedinController.dispose();
    skillAndLanguageController.dispose();

    isSelected = [false, false, false, false, false];

    skills.clear();
    languages.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(
          top: 70.h,
          left: 16.w,
          right: 16.w,
          bottom: 70.h,
        ),
        children: [
          _buildHeader(),
          SizedBox(
            height: 16.h,
          ),
          _buildBody(context),
        ],
      ),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLinkedinInformations(),
        SizedBox(
          height: 16.h,
        ),
        _buildSkillsInformations(context),
        SizedBox(
          height: 16.h,
        ),
        _buildLanguageInformations(context),
        SizedBox(
          height: 24.h,
        ),
        _buildSubmitButton(),
      ],
    );
  }

  Column _buildSubmitButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: linkedinController.text.isNotEmpty && skills.length > 1
              ? () {}
              : null,
          style: ElevatedButton.styleFrom(
              primary: indigoBlue, padding: const EdgeInsets.all(12)),
          child: Text(
            "Get Started",
            style: buttonTextStyle.copyWith(color: white),
          ),
        ),
      ],
    );
  }

  Column _buildLanguageInformations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Language",
              style: body1,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "(Optional)",
              style: bodyPale.copyWith(color: grey, fontSize: 12.sp),
            ),
          ],
        ),
        Wrap(
          spacing: 6,
          children: languages.map((languageModel) {
            if (languageModel == languages.first) {
              return Visibility(visible: false, child: Container());
            } else {
              return CustomDeletableChip(
                title: languageModel.languageName,
              );
            }
          }).toList(),
        ),
        CustomChips(
          onPressed: () async {
            await showCustomDialog(context, isSelected, true);
            setState(() {});
          },
          title: languages.first.languageName,
        ),
      ],
    );
  }

  Column _buildSkillsInformations(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Skills",
              style: body1,
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "(Ex: Java, business strategy)",
              style: bodyPale.copyWith(color: grey, fontSize: 12.sp),
            ),
          ],
        ),
        Wrap(
          spacing: 6,
          children: skills.map((skillModel) {
            if (skillModel == skills.first) {
              return Visibility(visible: false, child: Container());
            } else {
              return CustomDeletableChip(
                title:
                    "${skillModel.skillName} - ${skillModel.skillLevel.getSkillNameByIndex.name.toUpperCase()}",
              );
            }
          }).toList(),
        ),
        CustomChips(
          onPressed: () async {
            await showCustomDialog(context, isSelected, false);
            setState(() {});
          },
          title: skills.first.skillName,
        ),
      ],
    );
  }

  Column _buildLinkedinInformations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your linkedin URL",
          style: body1,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 5),
        CustomTextFormField(
          controller: linkedinController,
          hintText: "Enter your Linkedin profile URL",
          onChanged: (val) {
            setState(() {});
          },
        ),
        SizedBox(
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.touch_app,
              color: indigoBlue,
            ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
              child: Text(
                "Click here for your linkedin profile",
                style: linkText,
              ),
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }

  Column _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Build your",
                  style: headline3,
                ),
                Text(
                  "Profile",
                  style: headline1,
                ),
              ],
            ),
            const Icon(
              Icons.account_circle,
              size: 36,
            ),
          ],
        ),
        Text(
          "Enter your skills to improve match results.",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }

  Future<void> showCustomDialog(
      context, List<bool> isSelected, bool isLanguage) async {
    await showDialog(
      context: context,
      builder: (context) {
        /// We need to use StatefulBuilder for using
        /// setState in a dialog.
        return StatefulBuilder(builder: (
          context,
          setState,
        ) {
          return Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: veryLightGrey,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildDialogsHeader(context, isLanguage),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        isLanguage ? "Input a language" : "Input a skill",
                        style: body1,
                      ),
                      CustomTextFormField(
                          controller: skillAndLanguageController,
                          hintText: isLanguage ? "Ex: Turkish" : "Ex: Swift",
                          onFieldSubmitted: (value) {
                            setState(() {
                              skillAndLanguageController.text = value;
                            });
                          },
                          onChanged: (val) {
                            setState(() {
                              isSkillAddedSuccess = false;
                            });
                          }),
                      SizedBox(
                        height: 16.h,
                      ),
                      if (!isLanguage)
                        _buildSkillsDialogBody(setState, isSelected),
                      if (isLanguage) _buildLanguagesDialogButton(setState),
                      const SizedBox(
                        height: 7,
                      ),
                      _buildDialogsCloseButton(context),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
      },
    );
  }

  TextButton _buildDialogsCloseButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Close",
        style: bodyPale.copyWith(color: grey),
      ),
    );
  }

  Row _buildLanguagesDialogButton(StateSetter setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: skillAndLanguageController.text.isNotEmpty
              ? () {
                  final newLanguage = LanguageModel(
                    languageName: skillAndLanguageController.text,
                  );
                  languages.add(newLanguage);
                  skillAndLanguageController.clear();
                  setState(() {
                    isSkillAddedSuccess = true;
                    // skillName = "";
                  });
                }
              : null,
          style: ElevatedButton.styleFrom(
            fixedSize: Size(163.w, 46.h),
          ),
          child: Text(
            "Add",
            style: buttonTextStyle,
          ),
        ),
      ],
    );
  }

  Column _buildSkillsDialogBody(StateSetter setState, List<bool> isSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Skill level",
          style: body1,
          textAlign: TextAlign.start,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Novice",
              style: bodyPale.copyWith(color: grey, fontSize: 12),
            ),
            _buildSkillMeter(setState, isSelected),
            Text(
              "Expert",
              style: bodyPale.copyWith(color: grey, fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: 10.w,
        ),
        isSkillAddedSuccess
            ? Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: indigoBlue,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    skillAddedMessage,
                    style: const TextStyle(
                      color: indigoBlue,
                    ),
                  )
                ],
              )
            : const SizedBox(),
        SizedBox(
          height: 10.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: skillAndLanguageController.text.isNotEmpty &&
                      isSelected.contains(true)
                  ? () {
                      final newSkill = SkillModel(
                        skillLevel: isSelected.lastIndexOf(true),
                        skillName: skillAndLanguageController.text,
                      );

                      skills.add(newSkill);
                      skillAndLanguageController.clear();
                      setState(() {
                        for (var i = 0; i < isSelected.length; i++) {
                          isSelected[i] = false;
                        }
                        isSkillAddedSuccess = true;
                      });
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                fixedSize: Size(163.w, 46.h),
              ),
              child: Text(
                "Add",
                style: buttonTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row _buildSkillMeter(StateSetter setState, List<bool> isSelected) {
    return Row(
      children: [
        for (var i = 0; i <= 4; i++)
          GestureDetector(
            onTap: () {
              for (var j = 0; j <= i; j++) {
                setState(() {
                  isSelected[j] = true;
                });
              }

              for (var j = i + 1; j <= 4; j++) {
                setState(() {
                  isSelected[j] = false;
                });
              }
            },
            child: Container(
              height: 24.w,
              width: 34.w,
              decoration: BoxDecoration(
                color: isSelected[i] ? indigoBlue : grey,
                borderRadius: i == 0
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))
                    : i == 4
                        ? const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8))
                        : null,
                border: Border.all(
                  color: veryLightGrey,
                ),
              ),
            ),
          )
      ],
    );
  }

  Column _buildDialogsHeader(BuildContext context, bool isLanguage) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                color: grey,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                isLanguage ? "Add a Language" : "Add a Skill",
                style: headline1,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
