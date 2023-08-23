abstract class NewsStates {}

class NewsinitialState extends NewsStates{}
class NewsNavChangeStates extends NewsStates{}
class NewsLiquidPullStates extends NewsStates{}
class NewsChangeMoodStates extends NewsStates{}



class NewsBusinessLoadingStates extends NewsStates{}
class NewsBusinessGetSuccessDataStates extends NewsStates{}
class NewsBusinessGetErrorDataStates extends NewsStates{
  late final String error;
  NewsBusinessGetErrorDataStates(this.error);
}

class NewsScienceLoadingStates extends NewsStates{}
class NewsScienceGetSuccessDataStates extends NewsStates{}
class NewsScienceGetErrorDataStates extends NewsStates{
  late final String error;
  NewsScienceGetErrorDataStates(this.error);
}

class NewsSportLoadingStates extends NewsStates{}
class NewsSportGetSuccessDataStates extends NewsStates{}
class NewsSportGetErrorDataStates extends NewsStates{
  late final String error;
  NewsSportGetErrorDataStates(this.error);
}

class NewsSearchLoadingStates extends NewsStates{}
class NewsSearchGetSuccessDataStates extends NewsStates{}
class NewsSearchGetErrorDataStates extends NewsStates{
  late final String error;
  NewsSearchGetErrorDataStates(this.error);
}
