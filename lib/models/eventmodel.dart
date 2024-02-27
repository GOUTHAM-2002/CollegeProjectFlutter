class EventModel {
  String title;
  String description;
  DateTime dateTime;
  String faculty;
  int sem;
  EventModel(
      {required this.title,
      required this.description,
      required this.dateTime,
      required this.faculty,
      required this.sem});
}

List<EventModel> events = [
  EventModel(
    title: "Aiml Session",
    description: "Introduction to Artificial Intelligence and Machine Learning",
    dateTime: DateTime(2022, 3, 15, 10, 30),
    faculty: "Dr. Smith",
    sem: 5,
  ),
  EventModel(
    title: "Flutter Workshop",
    description: "Hands-on workshop on building mobile apps with Flutter",
    dateTime: DateTime(2022, 4, 10, 14, 0),
    faculty: "Prof. Johnson",
    sem: 5,
  ),
  EventModel(
    title: "Web Development Seminar",
    description: "Explore the latest trends in web development",
    dateTime: DateTime(2022, 5, 20, 13, 45),
    faculty: "Dr. Brown",
    sem: 4,
  ),
  EventModel(
    title: "Robotics Competition",
    description: "Annual robotics competition for engineering students",
    dateTime: DateTime(2022, 6, 5, 9, 0),
    faculty: "Prof. Davis",
    sem: 3,
  ),
  EventModel(
    title: "Data Science Talk",
    description:
        "Discussing the applications of data science in various fields",
    dateTime: DateTime(2022, 7, 8, 15, 30),
    faculty: "Dr. Miller",
    sem: 7,
  ),
];
