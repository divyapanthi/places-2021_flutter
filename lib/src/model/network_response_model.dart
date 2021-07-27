class NetworkResponseModel<T>{
  final bool status;
  final String? message;
  final T? data;

  NetworkResponseModel({required this.status, this.message, this.data});

}