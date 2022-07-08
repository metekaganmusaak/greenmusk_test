import 'dart:convert';

class OnboardingModel {
  final String imagePath;
  final int pageIndex;
  final String pageTitle;
  final String pageDescription;

  OnboardingModel({
    required this.imagePath,
    required this.pageIndex,
    required this.pageTitle,
    required this.pageDescription,
  });

  OnboardingModel copyWith({
    String? imagePath,
    int? pageIndex,
    String? pageTitle,
    String? pageDescription,
  }) {
    return OnboardingModel(
      imagePath: imagePath ?? this.imagePath,
      pageIndex: pageIndex ?? this.pageIndex,
      pageTitle: pageTitle ?? this.pageTitle,
      pageDescription: pageDescription ?? this.pageDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'pageIndex': pageIndex,
      'pageTitle': pageTitle,
      'pageDescription': pageDescription,
    };
  }

  factory OnboardingModel.fromMap(Map<String, dynamic> map) {
    return OnboardingModel(
      imagePath: map['imagePath'] ?? '',
      pageIndex: map['pageIndex']?.toInt() ?? 0,
      pageTitle: map['pageTitle'] ?? '',
      pageDescription: map['pageDescription'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingModel.fromJson(String source) =>
      OnboardingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'OnboardingModel(imagePath: $imagePath, pageIndex: $pageIndex, pageTitle: $pageTitle, pageDescription: $pageDescription)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OnboardingModel &&
        other.imagePath == imagePath &&
        other.pageIndex == pageIndex &&
        other.pageTitle == pageTitle &&
        other.pageDescription == pageDescription;
  }

  @override
  int get hashCode {
    return imagePath.hashCode ^
        pageIndex.hashCode ^
        pageTitle.hashCode ^
        pageDescription.hashCode;
  }

  static final List<OnboardingModel> onboardingDatas = [
    OnboardingModel(
      imagePath: "assets/images/image1.jpg",
      pageIndex: 0,
      pageTitle: "Join MentorGem with\none click.",
      pageDescription:
          "Joining MentorGem is easy. Join with\nLinkedin for the most optimal experience.\nOther login options are available.",
    ),
    OnboardingModel(
      imagePath: "assets/images/image2.jpg",
      pageIndex: 1,
      pageTitle: "Find your mentor\nquickly.",
      pageDescription:
          "Our smart match technology will match\nyou with a mentor best fit to help you\nachieve your goals.",
    ),
    OnboardingModel(
      imagePath: "assets/images/image3.jpg",
      pageIndex: 2,
      pageTitle: "Connect together and\ntalk.",
      pageDescription:
          "Choose the mentor that you like and start\ninteracting immediately. Enjoy the journey.",
    ),
  ];
}
