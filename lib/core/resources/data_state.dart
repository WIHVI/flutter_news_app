import 'package:news_app/core/error/exceptions.dart';

abstract class DataState<T> {
  final T? data;
  final ServerException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ServerException error) : super(error: error);
}
