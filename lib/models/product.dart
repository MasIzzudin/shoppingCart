import 'dart:convert';

class Products {
  final String? status;
  List<Product>? data;

  Products({
    this.status,
    this.data,
  });

  factory Products.fromRawJson(String str) =>
      Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Product {
  final int? id;
  final String? productName;
  final dynamic productAlias;
  final int? productCategoryId;
  final String? productType;
  final dynamic inventoryType;
  final String? barcode;
  final String? sku;
  final String? baseUnitName;
  final int? baseUnitId;
  final String? baseUnitCostPrice;
  final int? displaysOnPos;
  final int? stockAlert;
  final String? lowQuantity;
  final String? salesTaxType;
  final int? salesTaxId;
  final String? salesTaxRate;
  final String? salesTaxArticleType;
  final String? purchaseTaxType;
  final int? purchaseTaxId;
  final String? purchaseTaxRate;
  final String? purchaseTaxArticleType;
  final dynamic incomeTaxType;
  final dynamic incomeTaxId;
  final String? incomeTaxRate;
  final dynamic incomeTaxArticleType;
  final dynamic description;
  final int? defaultAccountInventory;
  final dynamic defaultAccountExpense;
  final int? defaultAccountSales;
  final int? defaultAccountSalesReturns;
  final int? defaultAccountSalesDiscounts;
  final int? defaultAccountGoodsShipped;
  final int? defaultAccountCostOfGoodSold;
  final int? defaultAccountPurchaseReturns;
  final int? defaultAccountUnbilledPayable;
  final String? productTypeLabel;
  final int? productId;
  final List<Unit>? units;
  final List<ProductBalance>? productBalances;
  final int? baseQuantity;
  final int? availableQuantity;
  final int? availableQuantityShow;
  final List<StandardProductCost>? standardProductCosts;
  final List<SalesPriceList>? salesPriceList;
  final List<dynamic>? productUnits;

  Product({
    this.id,
    this.productName,
    this.productAlias,
    this.productCategoryId,
    this.productType,
    this.inventoryType,
    this.barcode,
    this.sku,
    this.baseUnitName,
    this.baseUnitId,
    this.baseUnitCostPrice,
    this.displaysOnPos,
    this.stockAlert,
    this.lowQuantity,
    this.salesTaxType,
    this.salesTaxId,
    this.salesTaxRate,
    this.salesTaxArticleType,
    this.purchaseTaxType,
    this.purchaseTaxId,
    this.purchaseTaxRate,
    this.purchaseTaxArticleType,
    this.incomeTaxType,
    this.incomeTaxId,
    this.incomeTaxRate,
    this.incomeTaxArticleType,
    this.description,
    this.defaultAccountInventory,
    this.defaultAccountExpense,
    this.defaultAccountSales,
    this.defaultAccountSalesReturns,
    this.defaultAccountSalesDiscounts,
    this.defaultAccountGoodsShipped,
    this.defaultAccountCostOfGoodSold,
    this.defaultAccountPurchaseReturns,
    this.defaultAccountUnbilledPayable,
    this.productTypeLabel,
    this.productId,
    this.units,
    this.productBalances,
    this.baseQuantity,
    this.availableQuantity,
    this.availableQuantityShow,
    this.standardProductCosts,
    this.salesPriceList,
    this.productUnits,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["product_name"],
        productAlias: json["product_alias"],
        productCategoryId: json["product_category_id"],
        productType: json["product_type"],
        inventoryType: json["inventory_type"],
        barcode: json["barcode"],
        sku: json["sku"],
        baseUnitName: json["base_unit_name"],
        baseUnitId: json["base_unit_id"],
        baseUnitCostPrice: json["base_unit_cost_price"],
        displaysOnPos: json["displays_on_pos"],
        stockAlert: json["stock_alert"],
        lowQuantity: json["low_quantity"],
        salesTaxType: json["sales_tax_type"],
        salesTaxId: json["sales_tax_id"],
        salesTaxRate: json["sales_tax_rate"],
        salesTaxArticleType: json["sales_tax_article_type"],
        purchaseTaxType: json["purchase_tax_type"],
        purchaseTaxId: json["purchase_tax_id"],
        purchaseTaxRate: json["purchase_tax_rate"],
        purchaseTaxArticleType: json["purchase_tax_article_type"],
        incomeTaxType: json["income_tax_type"],
        incomeTaxId: json["income_tax_id"],
        incomeTaxRate: json["income_tax_rate"],
        incomeTaxArticleType: json["income_tax_article_type"],
        description: json["description"],
        defaultAccountInventory: json["default_account_inventory"],
        defaultAccountExpense: json["default_account_expense"],
        defaultAccountSales: json["default_account_sales"],
        defaultAccountSalesReturns: json["default_account_sales_returns"],
        defaultAccountSalesDiscounts: json["default_account_sales_discounts"],
        defaultAccountGoodsShipped: json["default_account_goods_shipped"],
        defaultAccountCostOfGoodSold: json["default_account_cost_of_good_sold"],
        defaultAccountPurchaseReturns: json["default_account_purchase_returns"],
        defaultAccountUnbilledPayable: json["default_account_unbilled_payable"],
        productTypeLabel: json["product_type_label"],
        productId: json["product_id"],
        units: json["units"] == null
            ? []
            : List<Unit>.from(json["units"]!.map((x) => Unit.fromJson(x))),
        productBalances: json["product_balances"] == null
            ? []
            : List<ProductBalance>.from(json["product_balances"]!
                .map((x) => ProductBalance.fromJson(x))),
        baseQuantity: json["base_quantity"],
        availableQuantity: json["available_quantity"],
        availableQuantityShow: json["available_quantity_show"],
        standardProductCosts: json["standard_product_costs"] == null
            ? []
            : List<StandardProductCost>.from(json["standard_product_costs"]!
                .map((x) => StandardProductCost.fromJson(x))),
        salesPriceList: json["sales_price_list"] == null
            ? []
            : List<SalesPriceList>.from(json["sales_price_list"]!
                .map((x) => SalesPriceList.fromJson(x))),
        productUnits: json["product_units"] == null
            ? []
            : List<dynamic>.from(json["product_units"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "product_alias": productAlias,
        "product_category_id": productCategoryId,
        "product_type": productType,
        "inventory_type": inventoryType,
        "barcode": barcode,
        "sku": sku,
        "base_unit_name": baseUnitName,
        "base_unit_id": baseUnitId,
        "base_unit_cost_price": baseUnitCostPrice,
        "displays_on_pos": displaysOnPos,
        "stock_alert": stockAlert,
        "low_quantity": lowQuantity,
        "sales_tax_type": salesTaxType,
        "sales_tax_id": salesTaxId,
        "sales_tax_rate": salesTaxRate,
        "sales_tax_article_type": salesTaxArticleType,
        "purchase_tax_type": purchaseTaxType,
        "purchase_tax_id": purchaseTaxId,
        "purchase_tax_rate": purchaseTaxRate,
        "purchase_tax_article_type": purchaseTaxArticleType,
        "income_tax_type": incomeTaxType,
        "income_tax_id": incomeTaxId,
        "income_tax_rate": incomeTaxRate,
        "income_tax_article_type": incomeTaxArticleType,
        "description": description,
        "default_account_inventory": defaultAccountInventory,
        "default_account_expense": defaultAccountExpense,
        "default_account_sales": defaultAccountSales,
        "default_account_sales_returns": defaultAccountSalesReturns,
        "default_account_sales_discounts": defaultAccountSalesDiscounts,
        "default_account_goods_shipped": defaultAccountGoodsShipped,
        "default_account_cost_of_good_sold": defaultAccountCostOfGoodSold,
        "default_account_purchase_returns": defaultAccountPurchaseReturns,
        "default_account_unbilled_payable": defaultAccountUnbilledPayable,
        "product_type_label": productTypeLabel,
        "product_id": productId,
        "units": units == null
            ? []
            : List<dynamic>.from(units!.map((x) => x.toJson())),
        "product_balances": productBalances == null
            ? []
            : List<dynamic>.from(productBalances!.map((x) => x.toJson())),
        "base_quantity": baseQuantity,
        "available_quantity": availableQuantity,
        "available_quantity_show": availableQuantityShow,
        "standard_product_costs": standardProductCosts == null
            ? []
            : List<dynamic>.from(standardProductCosts!.map((x) => x.toJson())),
        "sales_price_list": salesPriceList == null
            ? []
            : List<dynamic>.from(salesPriceList!.map((x) => x.toJson())),
        "product_units": productUnits == null
            ? []
            : List<dynamic>.from(productUnits!.map((x) => x)),
      };
}

class ProductBalance {
  final int? id;
  final int? productId;
  final String? warehouseName;
  final int? warehouseId;
  final DateTime? date;
  final dynamic barcode;
  final dynamic expirationDate;
  final dynamic batchNumber;
  final String? baseUnitCostPrice;
  final int? sourceId;
  final int? sourceProductId;
  final String? sourceType;
  final int? inventoryAdjustmentId;
  final int? productOpenBalance;
  final DateTime? openBalanceDate;
  final String? openBalanceBaseQuantity;
  final String? baseQuantity;
  final String? productName;
  final String? productBalanceName;

  ProductBalance({
    this.id,
    this.productId,
    this.warehouseName,
    this.warehouseId,
    this.date,
    this.barcode,
    this.expirationDate,
    this.batchNumber,
    this.baseUnitCostPrice,
    this.sourceId,
    this.sourceProductId,
    this.sourceType,
    this.inventoryAdjustmentId,
    this.productOpenBalance,
    this.openBalanceDate,
    this.openBalanceBaseQuantity,
    this.baseQuantity,
    this.productName,
    this.productBalanceName,
  });

  factory ProductBalance.fromRawJson(String str) =>
      ProductBalance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductBalance.fromJson(Map<String, dynamic> json) => ProductBalance(
        id: json["id"],
        productId: json["product_id"],
        warehouseName: json["warehouse_name"],
        warehouseId: json["warehouse_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        barcode: json["barcode"],
        expirationDate: json["expiration_date"],
        batchNumber: json["batch_number"],
        baseUnitCostPrice: json["base_unit_cost_price"],
        sourceId: json["source_id"],
        sourceProductId: json["source_product_id"],
        sourceType: json["source_type"],
        inventoryAdjustmentId: json["inventory_adjustment_id"],
        productOpenBalance: json["product_open_balance"],
        openBalanceDate: json["open_balance_date"] == null
            ? null
            : DateTime.parse(json["open_balance_date"]),
        openBalanceBaseQuantity: json["open_balance_base_quantity"],
        baseQuantity: json["base_quantity"],
        productName: json["product_name"],
        productBalanceName: json["product_balance_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "warehouse_name": warehouseName,
        "warehouse_id": warehouseId,
        "date": date?.toIso8601String(),
        "barcode": barcode,
        "expiration_date": expirationDate,
        "batch_number": batchNumber,
        "base_unit_cost_price": baseUnitCostPrice,
        "source_id": sourceId,
        "source_product_id": sourceProductId,
        "source_type": sourceType,
        "inventory_adjustment_id": inventoryAdjustmentId,
        "product_open_balance": productOpenBalance,
        "open_balance_date": openBalanceDate?.toIso8601String(),
        "open_balance_base_quantity": openBalanceBaseQuantity,
        "base_quantity": baseQuantity,
        "product_name": productName,
        "product_balance_name": productBalanceName,
      };
}

class SalesPriceList {
  final int? id;
  final String? productName;
  final int? salesPriceAdjustmentId;
  final int? productId;
  final String? warehouseName;
  final List<int>? warehouseId;
  final String? unitName;
  final int? unitId;
  final String? priceListName;
  final List<int>? priceListId;
  final String? minimumQuantity;
  final String? salesPrice;
  final String? minimumSalesPrice;
  final bool? ignore;
  final dynamic description;
  final List<Unit>? units;

  SalesPriceList({
    this.id,
    this.productName,
    this.salesPriceAdjustmentId,
    this.productId,
    this.warehouseName,
    this.warehouseId,
    this.unitName,
    this.unitId,
    this.priceListName,
    this.priceListId,
    this.minimumQuantity,
    this.salesPrice,
    this.minimumSalesPrice,
    this.ignore,
    this.description,
    this.units,
  });

  factory SalesPriceList.fromRawJson(String str) =>
      SalesPriceList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SalesPriceList.fromJson(Map<String, dynamic> json) => SalesPriceList(
        id: json["id"],
        productName: json["product_name"],
        salesPriceAdjustmentId: json["sales_price_adjustment_id"],
        productId: json["product_id"],
        warehouseName: json["warehouse_name"],
        warehouseId: json["warehouse_id"] == null
            ? []
            : List<int>.from(json["warehouse_id"]!.map((x) => x)),
        unitName: json["unit_name"],
        unitId: json["unit_id"],
        priceListName: json["price_list_name"],
        priceListId: json["price_list_id"] == null
            ? []
            : List<int>.from(json["price_list_id"]!.map((x) => x)),
        minimumQuantity: json["minimum_quantity"],
        salesPrice: json["sales_price"],
        minimumSalesPrice: json["minimum_sales_price"],
        ignore: json["ignore"],
        description: json["description"],
        units: json["units"] == null
            ? []
            : List<Unit>.from(json["units"]!.map((x) => Unit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "sales_price_adjustment_id": salesPriceAdjustmentId,
        "product_id": productId,
        "warehouse_name": warehouseName,
        "warehouse_id": warehouseId == null
            ? []
            : List<dynamic>.from(warehouseId!.map((x) => x)),
        "unit_name": unitName,
        "unit_id": unitId,
        "price_list_name": priceListName,
        "price_list_id": priceListId == null
            ? []
            : List<dynamic>.from(priceListId!.map((x) => x)),
        "minimum_quantity": minimumQuantity,
        "sales_price": salesPrice,
        "minimum_sales_price": minimumSalesPrice,
        "ignore": ignore,
        "description": description,
        "units": units == null
            ? []
            : List<dynamic>.from(units!.map((x) => x.toJson())),
      };
}

class Unit {
  final String? unitName;
  final int? unitId;
  final int? unitConversion;

  Unit({
    this.unitName,
    this.unitId,
    this.unitConversion,
  });

  factory Unit.fromRawJson(String str) => Unit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        unitName: json["unit_name"],
        unitId: json["unit_id"],
        unitConversion: json["unit_conversion"],
      );

  Map<String, dynamic> toJson() => {
        "unit_name": unitName,
        "unit_id": unitId,
        "unit_conversion": unitConversion,
      };
}

class StandardProductCost {
  final int? id;
  final String? productName;
  final int? standardProductCostId;
  final int? productId;
  final List<String>? warehouseName;
  final List<int>? warehouseId;
  final String? unitName;
  final int? unitId;
  final String? baseUnitName;
  final int? baseUnitId;
  final String? unitConversion;
  final String? standardProductCostPrice;
  final String? baseStandardProductCostPrice;
  final bool? ignore;
  final dynamic description;
  final List<Unit>? units;

  StandardProductCost({
    this.id,
    this.productName,
    this.standardProductCostId,
    this.productId,
    this.warehouseName,
    this.warehouseId,
    this.unitName,
    this.unitId,
    this.baseUnitName,
    this.baseUnitId,
    this.unitConversion,
    this.standardProductCostPrice,
    this.baseStandardProductCostPrice,
    this.ignore,
    this.description,
    this.units,
  });

  factory StandardProductCost.fromRawJson(String str) =>
      StandardProductCost.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StandardProductCost.fromJson(Map<String, dynamic> json) =>
      StandardProductCost(
        id: json["id"],
        productName: json["product_name"],
        standardProductCostId: json["standard_product_cost_id"],
        productId: json["product_id"],
        warehouseName: json["warehouse_name"] == null
            ? []
            : List<String>.from(json["warehouse_name"]!.map((x) => x)),
        warehouseId: json["warehouse_id"] == null
            ? []
            : List<int>.from(json["warehouse_id"]!.map((x) => x)),
        unitName: json["unit_name"],
        unitId: json["unit_id"],
        baseUnitName: json["base_unit_name"],
        baseUnitId: json["base_unit_id"],
        unitConversion: json["unit_conversion"],
        standardProductCostPrice: json["standard_product_cost_price"],
        baseStandardProductCostPrice: json["base_standard_product_cost_price"],
        ignore: json["ignore"],
        description: json["description"],
        units: json["units"] == null
            ? []
            : List<Unit>.from(json["units"]!.map((x) => Unit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "standard_product_cost_id": standardProductCostId,
        "product_id": productId,
        "warehouse_name": warehouseName == null
            ? []
            : List<dynamic>.from(warehouseName!.map((x) => x)),
        "warehouse_id": warehouseId == null
            ? []
            : List<dynamic>.from(warehouseId!.map((x) => x)),
        "unit_name": unitName,
        "unit_id": unitId,
        "base_unit_name": baseUnitName,
        "base_unit_id": baseUnitId,
        "unit_conversion": unitConversion,
        "standard_product_cost_price": standardProductCostPrice,
        "base_standard_product_cost_price": baseStandardProductCostPrice,
        "ignore": ignore,
        "description": description,
        "units": units == null
            ? []
            : List<dynamic>.from(units!.map((x) => x.toJson())),
      };
}
