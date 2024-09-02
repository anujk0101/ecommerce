abstract class HomeEvent{}

class FetchCategoryItemEvent extends HomeEvent{
  String? tokan;
  FetchCategoryItemEvent({required this.tokan});
}