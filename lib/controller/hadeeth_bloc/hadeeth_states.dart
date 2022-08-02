abstract class HadeethStates {}

class HadeethStatesInitialState extends HadeethStates {}

class CheckInternetConnectionState extends HadeethStates {}

class GetHadeethCategoriesLoadingState extends HadeethStates {}
class GetHadeethCategoriesSuccessState extends HadeethStates {}
class GetHadeethCategoriesErrorState extends HadeethStates {
  final String error;

  GetHadeethCategoriesErrorState(this.error);
}

class GetHadethLoading extends HadeethStates {}
class GetHadethSuccessState extends HadeethStates {}
class GetHadethErrorState extends HadeethStates {
  final String error;

  GetHadethErrorState(this.error);
}


class GetHadethDetailsLoadingState extends HadeethStates {}
class GetHadethDetailsSuccessState extends HadeethStates {}
class GetHadethDetailsErrorState extends HadeethStates {
  final String error;

  GetHadethDetailsErrorState(this.error);
}
