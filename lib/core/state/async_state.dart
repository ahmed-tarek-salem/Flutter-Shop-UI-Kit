import 'package:flutter/material.dart';

sealed class AsyncState<T> {
  const AsyncState();
}

class Loading<T> extends AsyncState<T> {
  const Loading();
}

class Success<T> extends AsyncState<T> {
  final T data;
  const Success(this.data);
}

class Error<T> extends AsyncState<T> {
  final String message;
  const Error(this.message);
}

extension AsyncStateBuilder<T> on AsyncState<T> {
  Widget when({
    required Widget Function() loading,
    required Widget Function(T data) success,
    required Widget Function(String message) error,
  }) {
    return switch (this) {
      Loading<T>() => loading(),
      Success<T>(:final data) => success(data),
      Error<T>(:final message) => error(message),
    };
  }
}
