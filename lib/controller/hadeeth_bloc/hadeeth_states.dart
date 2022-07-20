abstract class HadeethStates {}

class HadeethStatesInitialState extends HadeethStates {}

class CheckInternetConnectionState extends HadeethStates {}

class GetHadeethCategoriesLoadingState extends HadeethStates {}
class GetHadeethCategoriesSuccessState extends HadeethStates {}
class GetHadeethCategoriesErrorState extends HadeethStates {
  final String error;

  GetHadeethCategoriesErrorState(this.error);
}
