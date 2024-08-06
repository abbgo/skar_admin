import 'package:equatable/equatable.dart';

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

class ResultComplaint extends Equatable {
  final List<Complaint>? complaints;
  final String error;

  const ResultComplaint({this.complaints, required this.error});

  factory ResultComplaint.defaultResult() {
    return const ResultComplaint(complaints: null, error: '');
  }

  @override
  List<Object?> get props => [complaints, error];
}
