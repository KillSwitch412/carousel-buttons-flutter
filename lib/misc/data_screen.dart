import 'package:carousel_ui/models/milestone.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatelessWidget {
  DataScreen({Key? key}) : super(key: key);

  final Milestone milestone = milestones[0];
  final TextStyle textStyle = const TextStyle(color: Color(0xFF333333));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Used'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Start/End Dates:',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20),
            Text('StartDate: ${milestone.startDate}'),
            Text('EndDate: ${milestone.endDate}'),
            const SizedBox(height: 20),
            const Text(
              'If the app is started during the prescription time, the present date is the initail displayed date.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Date can be changed in /models/milestone.dart',
            ),
            const SizedBox(height: 20),
            Text('Data:', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: milestone.items.length,
                itemBuilder: (context, index) {
                  final item = milestone.items[index];

                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${item.medicine}', style: textStyle),
                        const SizedBox(height: 10),
                        Text('DayTime: ${item.dayTime}', style: textStyle),
                        const SizedBox(height: 10),
                        Text('Days: ${item.days}', style: textStyle),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
