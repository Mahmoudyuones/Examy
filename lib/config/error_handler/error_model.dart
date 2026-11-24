class ErrorModel {
  final String message;
  final int? code;

  ErrorModel({required this.message, this.code});

  factory ErrorModel.fromResponse({
    required Map<String, dynamic> json,
    required int? statusCode,
  }) {
    final dynamic error = json['error'];
    final dynamic message = json['message'];
    final dynamic errors = json['errors'];

    String extractedMessage;
    if (error is String && error.isNotEmpty) {
      extractedMessage = error;
    } else if (message is String && message.isNotEmpty) {
      extractedMessage = message;
    } else if (errors is Map<String, dynamic>) {
      final values = errors.values
          .whereType<List>()
          .expand((value) => value)
          .whereType<String>();
      extractedMessage = values.isNotEmpty
          ? values.join('\n')
          : 'Unknown error';
    } else {
      extractedMessage = 'Unknown error';
    }

    return ErrorModel(message: extractedMessage, code: statusCode);
  }
}
