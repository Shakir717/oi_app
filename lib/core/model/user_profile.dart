class UserProfile{
  String firstName,lastName;
  int selectedPoint;
  Map<String, dynamic> cards;

  UserProfile({this.firstName, this.lastName, this.selectedPoint, this.cards});

  factory UserProfile.fromMap(Map<String, dynamic> data) => UserProfile(
    firstName: data['firstName'],
    lastName: data['lastName'],
    selectedPoint: data['selectedPoint'],
    cards: data['cards']
  );

  Map<String, dynamic> toMap(UserProfile user) => {
    'firstName':user.firstName,
    'lastName':user.lastName,
    'selectedPoint':user.selectedPoint,
    'cards':user.cards
  };
}