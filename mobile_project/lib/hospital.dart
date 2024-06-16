class Hospital {
  String title;
  String? location;
  String? city;
  String? province;
  String? phoneNumber;
  int? bedCount;
  String? system;

  Hospital(this.title, this.location, this.city, this.province,
      this.phoneNumber, this.bedCount, this.system);

  static generateData() {
    List<Hospital> hospitals = [
      Hospital(
        "LakeRidge Health",
        "580 Harwood Ave S",
        "Ajax",
        "ON",
        "905-683-2320",
        100,
        "General Hospital",
      ),
      Hospital(
        "Taunton Health",
        "1290 Keith Ross Dr",
        "Oshawa",
        "ON",
        "905-723-8551",
        150,
        "Health Clinic",
      ),
      Hospital(
        "Simcoe Health",
        "200 Front St W",
        "Toronto",
        "ON",
        "416-599-9000",
        200,
        "Health Clinic",
      ),
      Hospital("King General", "No clue", "Toronto", "ON", "111-111-1111", 75,
          "General Hospital"),
      Hospital("Bond General", "No Clue", "Toronto", "ON", "222-222-2222", 100,
          "General Hospital")
    ];

    return hospitals;
  }
}
