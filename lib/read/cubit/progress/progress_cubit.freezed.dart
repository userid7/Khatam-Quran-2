// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'progress_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProgressStateTearOff {
  const _$ProgressStateTearOff();

  _ProgressState call({required int juz, required double progress}) {
    return _ProgressState(
      juz: juz,
      progress: progress,
    );
  }
}

/// @nodoc
const $ProgressState = _$ProgressStateTearOff();

/// @nodoc
mixin _$ProgressState {
  int get juz => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgressStateCopyWith<ProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressStateCopyWith<$Res> {
  factory $ProgressStateCopyWith(
          ProgressState value, $Res Function(ProgressState) then) =
      _$ProgressStateCopyWithImpl<$Res>;
  $Res call({int juz, double progress});
}

/// @nodoc
class _$ProgressStateCopyWithImpl<$Res>
    implements $ProgressStateCopyWith<$Res> {
  _$ProgressStateCopyWithImpl(this._value, this._then);

  final ProgressState _value;
  // ignore: unused_field
  final $Res Function(ProgressState) _then;

  @override
  $Res call({
    Object? juz = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      juz: juz == freezed
          ? _value.juz
          : juz // ignore: cast_nullable_to_non_nullable
              as int,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$ProgressStateCopyWith<$Res>
    implements $ProgressStateCopyWith<$Res> {
  factory _$ProgressStateCopyWith(
          _ProgressState value, $Res Function(_ProgressState) then) =
      __$ProgressStateCopyWithImpl<$Res>;
  @override
  $Res call({int juz, double progress});
}

/// @nodoc
class __$ProgressStateCopyWithImpl<$Res>
    extends _$ProgressStateCopyWithImpl<$Res>
    implements _$ProgressStateCopyWith<$Res> {
  __$ProgressStateCopyWithImpl(
      _ProgressState _value, $Res Function(_ProgressState) _then)
      : super(_value, (v) => _then(v as _ProgressState));

  @override
  _ProgressState get _value => super._value as _ProgressState;

  @override
  $Res call({
    Object? juz = freezed,
    Object? progress = freezed,
  }) {
    return _then(_ProgressState(
      juz: juz == freezed
          ? _value.juz
          : juz // ignore: cast_nullable_to_non_nullable
              as int,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
class _$_ProgressState implements _ProgressState {
  const _$_ProgressState({required this.juz, required this.progress});

  @override
  final int juz;
  @override
  final double progress;

  @override
  String toString() {
    return 'ProgressState(juz: $juz, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProgressState &&
            (identical(other.juz, juz) ||
                const DeepCollectionEquality().equals(other.juz, juz)) &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(juz) ^
      const DeepCollectionEquality().hash(progress);

  @JsonKey(ignore: true)
  @override
  _$ProgressStateCopyWith<_ProgressState> get copyWith =>
      __$ProgressStateCopyWithImpl<_ProgressState>(this, _$identity);
}

abstract class _ProgressState implements ProgressState {
  const factory _ProgressState({required int juz, required double progress}) =
      _$_ProgressState;

  @override
  int get juz => throw _privateConstructorUsedError;
  @override
  double get progress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProgressStateCopyWith<_ProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}
