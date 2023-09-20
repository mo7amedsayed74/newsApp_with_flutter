abstract class NewsAppStates{}

class InitialState extends NewsAppStates{}
class ChangeIndexState extends NewsAppStates{}
class ChangeModeState extends NewsAppStates{}

class LoadingState extends NewsAppStates{}

class GetBusinessArticlesSuccessfulState extends NewsAppStates{}
class GetBusinessArticlesErrorState extends NewsAppStates{
  final String error;
  GetBusinessArticlesErrorState(this.error);
}

class GetSportsArticlesSuccessfulState extends NewsAppStates{}
class GetSportsArticlesErrorState extends NewsAppStates{
  final String error;
  GetSportsArticlesErrorState(this.error);
}

class GetScienceArticlesSuccessfulState extends NewsAppStates{}
class GetScienceArticlesErrorState extends NewsAppStates{
  final String error;
  GetScienceArticlesErrorState(this.error);
}

class GetSearchArticlesSuccessfulState extends NewsAppStates{}
class GetSearchArticlesErrorState extends NewsAppStates{
  final String error;
  GetSearchArticlesErrorState(this.error);
}