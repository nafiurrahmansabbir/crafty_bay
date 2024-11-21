class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  dynamic responseData;
  String? errorMassage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMassage = 'Something is Wrong',
  });
}
