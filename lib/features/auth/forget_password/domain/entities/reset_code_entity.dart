import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_code_entity.freezed.dart';

@freezed
abstract class ResetCodeEntity with _$ResetCodeEntity {
  const factory ResetCodeEntity({required String code}) = _ResetCodeEntity;
}
