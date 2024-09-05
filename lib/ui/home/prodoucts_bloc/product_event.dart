abstract class ProductEvent{}

class ProductFetchEvent extends ProductEvent{
  bool isTokan;
  ProductFetchEvent({required this.isTokan});
}