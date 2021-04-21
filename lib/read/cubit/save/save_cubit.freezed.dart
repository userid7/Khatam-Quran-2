// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'save_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SaveStateTearOff {
  const _$SaveStateTearOff();

  Saved saved() {
    return const Saved();
  }

  NotSaved notSaved() {
    return const NotSaved();
  }
}

/// @nodoc
const $SaveState = _$SaveStateTearOff();

/// @nodoc
mixin _$SaveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saved,
    required TResult Function() notSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saved,
    TResult Function()? notSaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Saved value) saved,
    required TResult Function(NotSaved value) notSaved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Saved value)? saved,
    TResult Function(NotSaved value)? notSaved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveStateCopyWith<$Res> {
  factory $SaveStateCopyWith(SaveState value, $Res Function(SaveState) then) =
      _$SaveStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SaveStateCopyWithImpl<$Res> implements $SaveStateCopyWith<$Res> {
  _$SaveStateCopyWithImpl(this._value, this._then);

  final SaveState _value;
  // ignore: unused_field
  final $Res Function(SaveState) _then;
}

/// @nodoc
abstract class $SavedCopyWith<$Res> {
  factory $SavedCopyWith(Saved value, $Res Function(Saved) then) =
      _$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SavedCopyWithImpl<$Res> extends _$SaveStateCopyWithImpl<$Res>
    implements $SavedCopyWith<$Res> {
  _$SavedCopyWithImpl(Saved _value, $Res Function(Saved) _then)
      : super(_value, (v) => _then(v as Saved));

  @override
  Saved get _value => super._value as Saved;
}

/// @nodoc
class _$Saved implements Saved {
  const _$Saved();

  @override
  String toString() {
    return 'SaveState.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saved,
    required TResult Function() notSaved,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saved,
    TResult Function()? notSaved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Saved value) saved,
    required TResult Function(NotSaved value) notSaved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Saved value)? saved,
    TResult Function(NotSaved value)? notSaved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class Saved implements SaveState {
  const factory Saved() = _$Saved;
}

/// @nodoc
abstract class $NotSavedCopyWith<$Res> {
  factory $NotSavedCopyWith(NotSaved value, $Res Function(NotSaved) then) =
      _$NotSavedCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotSavedCopyWithImpl<$Res> extends _$SaveStateCopyWithImpl<$Res>
    implements $NotSavedCopyWith<$Res> {
  _$NotSavedCopyWithImpl(NotSaved _value, $Res Function(NotSaved) _then)
      : super(_value, (v) => _then(v as NotSaved));

  @override
  NotSaved get _value => super._value as NotSaved;
}

/// @nodoc
class _$NotSaved implements NotSaved {
  const _$NotSaved();

  @override
  String toString() {
    return 'SaveState.notSaved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NotSaved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() saved,
    required TResult Function() notSaved,
  }) {
    return notSaved();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? saved,
    TResult Function()? notSaved,
    required TResult orElse(),
  }) {
    if (notSaved != null) {
      return notSaved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Saved value) saved,
    required TResult Function(NotSaved value) notSaved,
  }) {
    return notSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Saved value)? saved,
    TResult Function(NotSaved value)? notSaved,
    required TResult orElse(),
  }) {
    if (notSaved != null) {
      return notSaved(this);
    }
    return orElse();
  }
}

abstract class NotSaved implements SaveState {
  const factory NotSaved() = _$NotSaved;
}
