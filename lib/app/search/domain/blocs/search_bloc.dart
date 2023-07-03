import 'package:bloc/bloc.dart';
import 'package:clean_dart_github_search/app/search/domain/repositories/search_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

import '../states/search_state.dart';

class SearchBloc extends Bloc<String, SearchState> implements Disposable {
  final SearchRepository repository;

  SearchBloc(this.repository) : super(const StartState()) {
    on<String>((textSearch, emit) async {
      if (textSearch.isEmpty) {
        emit(StartState());
        return;
      }
      emit(LoadingState());
      var newState = await repository.getUsers(textSearch);
      emit(newState);
    }, transformer: transform());
  }

  EventTransformer<String> transform<LoginEvent>() {
    return (events, mapper) => events.debounceTime(Duration(milliseconds: 500)).flatMap(mapper);
  }

  @override
  void dispose() {
    this.close();
  }
}
