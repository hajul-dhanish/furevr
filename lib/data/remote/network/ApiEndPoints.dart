import '../../Env/base_config.dart';

var application = Environment().config!;

class ApiEndPoints {
  final String fetchInventory = "${application.productListing}/Productlisting";
  final String loginAuth = "${application.validate}/Validate";
  final String mpinValidate = "${application.mpin}/mpin";
  final String fetchProductDetail =
      "${application.productDetails}/Productdetails";
  final String masterCatelog = "${application.fetchMasterData}/FetchMasterData";
  final String catelogUpload = "${application.inventoryUpload}/InventoryUpload";
  final String masterCatelogSubmit = "${application.masterUpload}/MasterUpload";
  final String fetchMasterImg = "${application.fetchImage}/FetchImage";
  final String stockPriceUpdate =
      "${application.updateInventory}/Updateinventory";
  final String stockCategory =
      "${application.pendingInventory}/pendinginventory";
  final String topSearchBulk = "${application.topSearch}/Topsearch";
  final String leftFilter = "${application.getAllData}/getalldata";
  final String orderhistory = "${application.orderHistory}/orderhistory";
  final String dealerwiseordereditems =
      "${application.dealerWiseOrder}/dealerwiseordereditems";
}
