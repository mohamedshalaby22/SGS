class Attendence {
  String date;
  String attendent;
  bool status;

  Attendence({
    required this.date,
    required this.attendent,
    required this.status,
  });
}

List attendence = [
  Attendence(
    date: '2022-5-7',
    attendent: 'attendant +',
    status: true,
  ),
  Attendence(
    date: '2022-5-8',
    attendent: 'attendant +',
    status: true,
  ),
  Attendence(
    date: '2022-5-11',
    attendent: 'absent x',
    status: false,
  ),
  Attendence(
    date: '2022-5-17',
    attendent: 'attendant +',
    status: true,
  ),
  Attendence(
    date: '2022-6-3',
    attendent: 'absent x',
    status: false,
  ),
  Attendence(
    date: '2022-6-4',
    attendent: 'absent x',
    status: false,
  ),
  Attendence(
    date: '2022-6-6',
    attendent: 'attendant +',
    status: true,
  ),
  Attendence(
    date: '2022-6-21',
    attendent: 'absent x',
    status: false,
  ),
  Attendence(
    date: '2022-6-25',
    attendent: 'attendant +',
    status: true,
  ),
];
