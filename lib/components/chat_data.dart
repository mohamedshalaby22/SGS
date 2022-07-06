class Data {
  String text;
  bool isSender;
  Data({
    required this.text,
    required this.isSender,
  });
}

List sendData = [
  Data(text: 'First Message', isSender: true),
  Data(text: 'Second Message', isSender: false),
  Data(text: 'Ali Mohamed', isSender: true),
  Data(text: 'How Are You', isSender: true),
  Data(text: 'I\'m fine thank you', isSender: false),
  Data(text: 'First Message', isSender: false),
  Data(text: 'Second Message', isSender: false),
  Data(text: 'Ali Mohamed', isSender: true),
  Data(text: 'How Are You', isSender: true),
  Data(text: 'I\'m fine thank you', isSender: false),
];
