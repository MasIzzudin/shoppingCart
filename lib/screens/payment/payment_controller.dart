import 'dart:convert';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/models/line_items.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:shopping_cart/screens/payment/components/result_payment_dialog.dart';

import '../../constant/constant.dart';

class Payment {
  int? id;
  String? name;

  Payment({
    this.id,
    this.name,
  });
}

class PaymentController extends GetxController {
  Products? products;
  late TextEditingController paymentController;
  late CurrencyTextInputFormatter formatter;
  FocusNode paymentFocusNode = FocusNode();

  List<LineItems> items = [];
  num subTotal = 0;
  late var selectedPayment = Payment().obs;
  var payments = [
    Payment(id: 1, name: "Cash"),
    Payment(id: 2, name: "EDC BCA"),
    Payment(id: 3, name: "QRISH"),
  ];

  var selectedDenominationPrice = RxNum(0);
  var denominationPrices = [].obs;

  setPayment(Payment value) => selectedPayment.value = value;
  chooseDenominationPrice(num value) {
    selectedDenominationPrice.value = value;
    paymentController.text = GFunction.formatCurrency(value);
  }

  onChangePayment(String value) {
    if (value != "") {
      paymentController.text = value;
    }
  }

  checkInputPayment() {
    if (paymentController.text.isEmpty) {
      chooseDenominationPrice(denominationPrices.first);
    }

    paymentFocusNode.unfocus();
  }

  @override
  void onInit() {
    readJson();
    selectedPayment.value = payments.first;
    paymentController = TextEditingController();
    formatter = CurrencyTextInputFormatter.currency(locale: "id", symbol: "Rp");
    super.onInit();
  }

  Future readJson() async {
    final String response =
        await rootBundle.loadString('assets/documents/products.json');
    Map<String, dynamic> json = await jsonDecode(response);
    products = Products.fromJson(json);
    List<Product> minList = products!.data!
        .where((element) =>
            element.productCategoryId == 2 &&
            element.productType!.toLowerCase() == 'inventory')
        .take(5)
        .toList();
    int index = 0;
    for (var element in minList) {
      index++;
      items.add(LineItems(
          id: index,
          price: element.salesPriceList!.isNotEmpty
              ? num.parse(element.salesPriceList!.first.salesPrice!)
              : 0,
          productName: element.productName!,
          productType: element.productType!,
          productCategoryId: element.productCategoryId!,
          quantity: index + 1));
    }

    calculateItems();
    update();
  }

  void removeItem(int index) {
    LineItems getItems = items[index];
    if (getItems.quantity! > 1) {
      getItems.quantity = getItems.quantity! - 1;
      items[index] = getItems;
      calculateItems();
      update();
    }
  }

  void addItem(int index) {
    LineItems getItems = items[index];
    getItems.quantity = getItems.quantity! + 1;
    items[index] = getItems;
    calculateItems();
    update();
  }

  calculateItems() {
    subTotal = 0;
    for (var element in items) {
      subTotal += element.price! * element.quantity!;
    }

    denominationPrices.value = generateDenominationPrice();
    chooseDenominationPrice(denominationPrices.first);
    update();
  }

  List<num> isLastValueGreaterThan(num value, List<num> buttons) {
    num lastButton = buttons.last;
    bool isLastValid = lastButton % 10000 == value;

    if (!isLastValid) {
      // Hapus elemen yang mengandung angka 5000 di akhir nominal
      buttons = buttons.where((number) => number % 10000 != value).toList();
    } else {
      buttons = buttons.sublist(0, 3);
    }

    return buttons;
  }

  List<num> generateDenominationPrice() {
    num total = subTotal;
    List availableCounts = [2000, 5000, 10000, 20000, 50000, 100000];
    List<num> paymentButtonCounts = [];
    List<num> buttons = [];
    if (total > 100000) {
      num finalTotal = total / 100000;
      RegExp regex = RegExp(r"([.]*0)(?!.*\d)");
      num numRegex =
          num.parse(finalTotal.toString().replaceAll(regex, "replace"));

      if (numRegex is double) {
        buttons = richDenomination(total, paymentButtonCounts, availableCounts);
        buttons = [total, ...buttons];
        buttons.sort();
        buttons = isLastValueGreaterThan(5000, buttons);
      } else {
        buttons = [total];
      }
    } else {
      buttons = lowDenomination(total);
      buttons.sort();
    }

    return buttons;
  }

  List<num> lowDenomination(total) {
    List<num> availableCounts = [
      1,
      2,
      5,
      10,
      20,
      50,
      100,
      200,
      500,
      1000,
      2000,
      5000,
      10000,
      20000,
      50000,
      100000
    ];

    List<num> paymentCounts = [total];

    if (total > availableCounts[availableCounts.length - 1]) {
      if (total % 5000 == 0) {
        paymentCounts.add(total + (5000 * 1));
      } else {
        paymentCounts.add(((total / 5000).round() + 1) * 5000);
      }
    }

    return paymentCounts;
  }

  List<num> richDenomination(
      num total, List<num> paymentButtonCounts, List availableCounts) {
    List.generate(availableCounts.length, (index) {
      var count = availableCounts[index];
      if (!paymentButtonCounts.contains(count)) {
        // jika jumlah total yang tersedia lebih besar dari total pembayaran
        if (count > total) {
          paymentButtonCounts.add(count);
        }
      }
    });

    //jika jumlah button tidak mencukupi dikarenakan jumlah total yang tersedia tidak mencukupi
    if (paymentButtonCounts.length < 3) {
      List asc = availableCounts.map((element) => element + 5000).toList();
      richDenomination(
          total, paymentButtonCounts, asc.length > 3 ? asc.sublist(3, 6) : asc);
    }

    return paymentButtonCounts;
  }

  void sendPayment() {
    List<Map<String, dynamic>> lineItems =
        List<Map<String, dynamic>>.from(items.map((x) => x.toJson()));
    Map dataPost = {
      "total_amount": paymentController.text,
      "line_items": "$lineItems",
      "payment_method": "${selectedPayment.value.id}",
    };

    final prettyString = JsonEncoder.withIndent('  ').convert(dataPost);

    Get.dialog(ResultPaymentDialog(
      message: prettyString,
    ));
  }
}
