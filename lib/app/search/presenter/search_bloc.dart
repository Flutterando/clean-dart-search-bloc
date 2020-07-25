import 'package:bloc/bloc.dart';
import 'package:clean_dart_github_search/app/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart_github_search/app/search/presenter/states/search_state.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

part 'search_bloc.g.dart';

@Injectable()
class SearchBloc extends Bloc<String, SearchState> implements Disposable {
  final SearchByText searchByText;

  SearchBloc(this.searchByText) : super(const StartState());

  @override
  Stream<SearchState> mapEventToState(String textSearch) async* {
    if (textSearch.isEmpty) {
      yield StartState();
      return;
    }

    yield const LoadingState();

    var result = await searchByText(textSearch);
    yield result.fold(
      (failure) => ErrorState(failure),
      (success) => SuccessState(success),
    );
  }

  @override
  Stream<Transition<String, SearchState>> transformEvents(
      Stream<String> events, transitionFn) {
    events = events.debounceTime(Duration(milliseconds: 500));
    return super.transformEvents(events, transitionFn);
  }

  @override
  void dispose() {
    this.close();
  }
}
