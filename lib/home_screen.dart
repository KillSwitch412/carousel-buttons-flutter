import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_ui/misc/data_screen.dart';
import 'package:flutter/material.dart';

import 'models/milestone.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Milestone milestone = milestones[0];

  // totalDays is the number of days between and including 'start' and 'end' date
  late int totalDays;
  // initialIndex is the present date of the user
  late int initialIndex;
  // daysPassed is the days passed since the first day
  late int daysPassed;

  // (returns days between 2 givenDates) - 1
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  // return date after adding given days
  DateTime getDay(DateTime startDate, int index) {
    return startDate.add(Duration(days: index));
  }

  @override
  void initState() {
    totalDays = daysBetween(milestone.startDate, milestone.endDate) + 1;
    daysPassed = daysBetween(milestone.startDate, DateTime.now());

    // if user is viewing milestones of an appointment after it's time has passed,
    // then show the user the last day milestones
    if (daysPassed > totalDays) {
      initialIndex = totalDays - 1;
    } else {
      initialIndex = daysPassed;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carousel'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DataScreen()),
              );
            },
            child: const Text('Test Data'),
          ),
        ],
      ),
      backgroundColor: const Color(0xFF333333),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Date:', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            dateCarousel(),
            const SizedBox(height: 20),
            Text('Milestones:', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            const Text('Morning:'),
            const SizedBox(height: 20),
            milestoneCards(dayTime: DayTime.morning),
            const SizedBox(height: 20),
            const Text('Afternoon:'),
            const SizedBox(height: 20),
            milestoneCards(dayTime: DayTime.afternoon),
            const SizedBox(height: 20),
            const Text('Evening:'),
            const SizedBox(height: 20),
            milestoneCards(dayTime: DayTime.evening),
          ],
        ),
      ),
    );
  }

  Expanded milestoneCards({required DayTime dayTime}) {
    return Expanded(
      child: ListView.builder(
        itemCount: milestone.items
            .where(
              (element) =>
                  element.dayTime.contains(dayTime) &&
                  daysPassed < element.days,
            )
            .length,
        itemBuilder: (context, index) {
          final item = milestone.items
              .where(
                (element) =>
                    element.dayTime.contains(dayTime) &&
                    daysPassed < element.days,
              )
              .toList()[index];
          return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('${index + 1} - ${item.medicine}'),
          );
        },
      ),
    );
  }

  CarouselSlider dateCarousel() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 100,
        autoPlay: false,
        pageSnapping: true,
        viewportFraction: 0.35,
        enlargeCenterPage: true,
        initialPage: initialIndex,
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index, reason) {
          // daysPasses = daysBetween (startDate and the day for which the user
          // is checking on)
          setState(() {
            daysPassed = daysBetween(
              milestone.startDate,
              getDay(milestone.startDate, index),
            );
          });
        },
      ),
      itemCount: totalDays,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Text(
              getDay(milestone.startDate, index).day.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        );
      },
    );
  }
}
