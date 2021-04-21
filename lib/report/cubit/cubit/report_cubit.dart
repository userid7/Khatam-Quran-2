import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:khatam_quran_2/report/models/report_model.dart';
import 'package:khatam_quran_2/report/services/report_repository.dart';

part 'report_state.dart';
part 'report_cubit.freezed.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(const ReportState.loading()) {
    init();
  }

  var reportRepository = ReportRepository();

  void init() async {
    var reportData = await reportRepository.getReport();
    emit(ReportState.data(reportData));
  }

  void setTargetDate(DateTime targetDate) async {
    emit(const ReportState.loading());
    await reportRepository.setTargetDate(targetDate);
    var reportData = await reportRepository.getReport();
    emit(ReportState.data(reportData));
  }
}
