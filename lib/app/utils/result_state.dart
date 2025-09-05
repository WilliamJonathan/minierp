abstract class ResultState<T> {
  R fold<R>({
    required R Function(T result) onSuccess,
    required R Function(String message) onError,
  });
}

class ErrorResultState<T> implements ResultState<T> {
  final String message;
  ErrorResultState({required this.message});

  @override
  R fold<R>({
    required R Function(T result) onSuccess,
    required R Function(String message) onError,
  }) {
    return onError(message);
  }
}

class SuccessResultState<T> implements ResultState<T> {
  final T result;
  SuccessResultState({required this.result});

  @override
  R fold<R>({
    required R Function(T result) onSuccess,
    required R Function(String message) onError,
  }) {
    return onSuccess(result);
  }
}
