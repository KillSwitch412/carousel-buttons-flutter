class Milestone {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final List<MilestoneItem> items;

  Milestone({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.items,
  });
}

enum DayTime {
  morning,
  afternoon,
  evening,
}

class MilestoneItem {
  final String medicine;
  final String time;
  final int days;
  final List<DayTime> dayTime;

  MilestoneItem({
    required this.medicine,
    required this.time,
    required this.dayTime,
    required this.days,
  });
}

final milestones = <Milestone>[
  Milestone(
    name: 'Milestone 1',
    startDate: DateTime(2022, 8, 27),
    endDate: DateTime(2022, 8, 31),
    items: <MilestoneItem>[
      MilestoneItem(
        medicine: 'Paracetamol',
        dayTime: [DayTime.morning],
        time: '09:00',
        days: 5,
      ),
      MilestoneItem(
        medicine: 'Aspirin',
        dayTime: [DayTime.morning],
        time: '09:00',
        days: 3,
      ),
      MilestoneItem(
        medicine: 'Darco',
        dayTime: [DayTime.afternoon],
        time: '01:00',
        days: 4,
      ),
      MilestoneItem(
        medicine: 'Pericone',
        dayTime: [DayTime.evening],
        time: '08:00',
        days: 5,
      ),
      MilestoneItem(
        medicine: 'Panadol',
        dayTime: [DayTime.evening, DayTime.morning],
        time: '08:00',
        days: 2,
      ),
    ],
  ),
];
