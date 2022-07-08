import 'package:greenmusk_test/models/skill_model.dart';

extension EnumConverter on int{
  SkillLevel get getSkillNameByIndex{
    if(this == 0)
    {
      return SkillLevel.novice;
    }
    else if(this == 1)
    {
      return SkillLevel.beginner;
    }
    else if(this == 2)
    {
      return SkillLevel.competenent;
    }
    else if(this == 3)
    {
      return SkillLevel.proficient;
    }
    else
    {
      return SkillLevel.expert;
    }
  }
}