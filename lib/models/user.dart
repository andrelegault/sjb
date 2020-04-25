/// User model represents a user signing up
class User {
  final String firstName;
  final String lastName;
  final DateTime dob;
  final String city;
  final String studyField;
  final PositionStatus positionStatus;
  final String term;

  User(
      {this.firstName,
      this.lastName,
      this.dob,
      this.city,
      this.studyField,
      this.positionStatus,
      this.term});
}

enum PositionStatus {
  full_time,
  part_time,
}