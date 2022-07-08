enum SkillLevel { novice, beginner, competenent, proficient, expert }

class SkillModel {
  final String skillName;
  final int skillLevel;

  SkillModel({
    required this.skillName,
    required this.skillLevel,
  });
}
