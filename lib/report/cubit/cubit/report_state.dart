part of 'report_cubit.dart';

@freezed
abstract class ReportState with _$ReportState {
  const factory ReportState.loading() = _Loading;
  const factory ReportState.data(ReportModel reportData) = _Data;
}
