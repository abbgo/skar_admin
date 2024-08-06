class Complaint {
  final String textTM, textRU;

  Complaint({required this.textTM, required this.textRU});

  factory Complaint.defaultComplaint() {
    return Complaint(textTM: '', textRU: '');
  }

  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      textTM: json['text_tm'],
      textRU: json['text_ru'],
    );
  }
}
