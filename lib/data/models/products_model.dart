class DataModel {
  String? id, name, price, image, category_id, status, created_at, updated_at;

  DataModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.category_id,
      required this.status,
      required this.created_at,
      required this.updated_at});

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        image: map['image'],
        category_id: map['category_id'],
        status: map['status'],
        created_at: map['created_at'],
        updated_at: map['updated_at']);
  }
}

class ProductsModel{
  bool status;
  String message;
  List<DataModel?> data;

  ProductsModel({required this.status,required this.message,required this.data});

  factory ProductsModel.fromMap(Map<String,dynamic> map){
    List<DataModel> mdata=[];
    for(Map<String,dynamic> eachData in map['data']){
      mdata.add(DataModel.fromMap(eachData));
    }
  return ProductsModel(status: map['status'], message: map['message'], data: mdata);
  }


}
