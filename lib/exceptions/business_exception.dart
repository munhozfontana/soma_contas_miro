class BusinessException implements Exception {
  List<String> error;
  String fileName;

  BusinessException({
    required this.error,
    required this.fileName,
  });
}
