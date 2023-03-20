class BusinessException implements Exception {
  List<String> error;
  BusinessException({
    required this.error,
  });
}
