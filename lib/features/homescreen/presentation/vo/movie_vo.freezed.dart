// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_vo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieVo {
  List<Movie> get list => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieVoCopyWith<MovieVo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieVoCopyWith<$Res> {
  factory $MovieVoCopyWith(MovieVo value, $Res Function(MovieVo) then) =
      _$MovieVoCopyWithImpl<$Res>;
  $Res call({List<Movie> list});
}

/// @nodoc
class _$MovieVoCopyWithImpl<$Res> implements $MovieVoCopyWith<$Res> {
  _$MovieVoCopyWithImpl(this._value, this._then);

  final MovieVo _value;
  // ignore: unused_field
  final $Res Function(MovieVo) _then;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      list: list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieVoCopyWith<$Res> implements $MovieVoCopyWith<$Res> {
  factory _$$_MovieVoCopyWith(
          _$_MovieVo value, $Res Function(_$_MovieVo) then) =
      __$$_MovieVoCopyWithImpl<$Res>;
  @override
  $Res call({List<Movie> list});
}

/// @nodoc
class __$$_MovieVoCopyWithImpl<$Res> extends _$MovieVoCopyWithImpl<$Res>
    implements _$$_MovieVoCopyWith<$Res> {
  __$$_MovieVoCopyWithImpl(_$_MovieVo _value, $Res Function(_$_MovieVo) _then)
      : super(_value, (v) => _then(v as _$_MovieVo));

  @override
  _$_MovieVo get _value => super._value as _$_MovieVo;

  @override
  $Res call({
    Object? list = freezed,
  }) {
    return _then(_$_MovieVo(
      list: list == freezed
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$_MovieVo implements _MovieVo {
  const _$_MovieVo({required final List<Movie> list}) : _list = list;

  final List<Movie> _list;
  @override
  List<Movie> get list {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'MovieVo(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieVo &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  _$$_MovieVoCopyWith<_$_MovieVo> get copyWith =>
      __$$_MovieVoCopyWithImpl<_$_MovieVo>(this, _$identity);
}

abstract class _MovieVo implements MovieVo {
  const factory _MovieVo({required final List<Movie> list}) = _$_MovieVo;

  @override
  List<Movie> get list;
  @override
  @JsonKey(ignore: true)
  _$$_MovieVoCopyWith<_$_MovieVo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Movie {
  String get id => throw _privateConstructorUsedError;
  String get poster => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get des => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  bool get isLike => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieCopyWith<Movie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCopyWith<$Res> {
  factory $MovieCopyWith(Movie value, $Res Function(Movie) then) =
      _$MovieCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String poster,
      String name,
      String des,
      double rating,
      bool isLike});
}

/// @nodoc
class _$MovieCopyWithImpl<$Res> implements $MovieCopyWith<$Res> {
  _$MovieCopyWithImpl(this._value, this._then);

  final Movie _value;
  // ignore: unused_field
  final $Res Function(Movie) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? poster = freezed,
    Object? name = freezed,
    Object? des = freezed,
    Object? rating = freezed,
    Object? isLike = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poster: poster == freezed
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      des: des == freezed
          ? _value.des
          : des // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      isLike: isLike == freezed
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieCopyWith<$Res> implements $MovieCopyWith<$Res> {
  factory _$$_MovieCopyWith(_$_Movie value, $Res Function(_$_Movie) then) =
      __$$_MovieCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String poster,
      String name,
      String des,
      double rating,
      bool isLike});
}

/// @nodoc
class __$$_MovieCopyWithImpl<$Res> extends _$MovieCopyWithImpl<$Res>
    implements _$$_MovieCopyWith<$Res> {
  __$$_MovieCopyWithImpl(_$_Movie _value, $Res Function(_$_Movie) _then)
      : super(_value, (v) => _then(v as _$_Movie));

  @override
  _$_Movie get _value => super._value as _$_Movie;

  @override
  $Res call({
    Object? id = freezed,
    Object? poster = freezed,
    Object? name = freezed,
    Object? des = freezed,
    Object? rating = freezed,
    Object? isLike = freezed,
  }) {
    return _then(_$_Movie(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poster: poster == freezed
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      des: des == freezed
          ? _value.des
          : des // ignore: cast_nullable_to_non_nullable
              as String,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      isLike: isLike == freezed
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Movie implements _Movie {
  const _$_Movie(
      {required this.id,
      required this.poster,
      required this.name,
      required this.des,
      required this.rating,
      required this.isLike});

  @override
  final String id;
  @override
  final String poster;
  @override
  final String name;
  @override
  final String des;
  @override
  final double rating;
  @override
  final bool isLike;

  @override
  String toString() {
    return 'Movie(id: $id, poster: $poster, name: $name, des: $des, rating: $rating, isLike: $isLike)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Movie &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.poster, poster) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.des, des) &&
            const DeepCollectionEquality().equals(other.rating, rating) &&
            const DeepCollectionEquality().equals(other.isLike, isLike));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(poster),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(des),
      const DeepCollectionEquality().hash(rating),
      const DeepCollectionEquality().hash(isLike));

  @JsonKey(ignore: true)
  @override
  _$$_MovieCopyWith<_$_Movie> get copyWith =>
      __$$_MovieCopyWithImpl<_$_Movie>(this, _$identity);
}

abstract class _Movie implements Movie {
  const factory _Movie(
      {required final String id,
      required final String poster,
      required final String name,
      required final String des,
      required final double rating,
      required final bool isLike}) = _$_Movie;

  @override
  String get id;
  @override
  String get poster;
  @override
  String get name;
  @override
  String get des;
  @override
  double get rating;
  @override
  bool get isLike;
  @override
  @JsonKey(ignore: true)
  _$$_MovieCopyWith<_$_Movie> get copyWith =>
      throw _privateConstructorUsedError;
}
