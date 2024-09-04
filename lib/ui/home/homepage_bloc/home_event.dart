abstract class HomeEvent{}

class FetchCategoryItemEvent extends HomeEvent{
  bool isTokan;
  FetchCategoryItemEvent({required this.isTokan});
}