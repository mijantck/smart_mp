class ErrorResponse {
  final String message;
  final Map<String, dynamic> errors;

  ErrorResponse({
    required this.message,
    required this.errors,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'],
      errors: json['errors'],
    );
  }
}
