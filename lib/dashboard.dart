import 'package:college/models/eventmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        shadowColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text('Event Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'My Events (5th Semester)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              EventList(events: getSemesterEvents(5)),
              const SizedBox(height: 20),
              const Text(
                'All Events',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              EventList(events: events),
            ],
          ),
        ),
      ),
    );
  }

  // Function to filter events by semester
  List<EventModel> getSemesterEvents(int semester) {
    return events.where((event) => event.sem == semester).toList();
  }
}

class EventList extends StatelessWidget {
  final List<EventModel> events;
  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MMMM d, y HH:mm a').format(dateTime);
  }

  const EventList({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: events.map((event) {
        return GestureDetector(
          onTap: () {
            // Open a pop-up screen with event details
            _showEventDetails(context, event);
          },
          child: Card(
            color: Colors.orange,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text('Date and Time: ${_formatDateTime(event.dateTime)}'),
                  Text('Faculty: ${event.faculty}'),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Function to show event details in a pop-up screen
  void _showEventDetails(BuildContext context, EventModel event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(event.title),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(event.description),
              const SizedBox(height: 10),
              Text(_formatDateTime(event.dateTime)),
              const SizedBox(height: 10),
              Text('Faculty: ${event.faculty}'),
              Text('Semester: ${event.sem}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
