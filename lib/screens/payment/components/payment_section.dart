import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/constant/constant.dart';
import 'package:shopping_cart/widgets/widgets.dart';

import '../payment_controller.dart';

class PaymentSection extends GetView<PaymentController> {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: width,
      child: GetBuilder<PaymentController>(
          init: PaymentController(),
          builder: (ctx) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    CommonText(
                      text: "Pembayaran",
                      weight: FontWeight.w800,
                      size: FontSize.f18,
                    ),
                    CommonText(
                        text:
                            "${controller.payments.isNotEmpty ? controller.payments.length : 0} opsi pembayaran tersedia"),
                    Gap(15),
                    Divider(),
                    Gap(15),
                    CommonText(
                      text: "Metode Bayar",
                      size: FontSize.f18,
                      weight: FontWeight.w800,
                    ),
                    Gap(10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Row(
                          spacing: 20,
                          children: List.generate(ctx.payments.length, (index) {
                            Payment data = ctx.payments[index];
                            return Obx(() => InkWell(
                                  onTap: () => ctx.setPayment(data),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: ctx.selectedPayment.value.id ==
                                                data.id
                                            ? mainColor
                                            : whiteColor,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: mainColor)),
                                    child: CommonText(
                                      text: data.name,
                                      color: ctx.selectedPayment.value.id ==
                                              data.id
                                          ? whiteColor
                                          : mainColor,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                ));
                          }),
                        ),
                        Divider(),
                        CommonText(
                          text: "Total Bayar",
                          color: greyColor,
                          size: FontSize.f12,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          focusNode: ctx.paymentFocusNode,
                          onEditingComplete: () => ctx.checkInputPayment(),
                          inputFormatters: <TextInputFormatter>[
                            CurrencyTextInputFormatter.currency(
                                locale: "id", symbol: "Rp ", decimalDigits: 0)
                          ],
                          controller: ctx.paymentController,
                          onChanged: (value) => ctx.onChangePayment(value),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Total harga",
                              hintStyle: TextStyle(color: greyColor),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: greyColor))),
                        )
                      ],
                    ),
                    Gap(15),
                    Obx(() => Row(
                          spacing: 20,
                          children: List.generate(ctx.denominationPrices.length,
                              (index) {
                            num price = ctx.denominationPrices[index];
                            return InkWell(
                              onTap: () => ctx.chooseDenominationPrice(price),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    color:
                                        ctx.selectedDenominationPrice.value ==
                                                price
                                            ? mainColor
                                            : whiteColor,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: mainColor)),
                                child: CommonText(
                                    text: price == ctx.subTotal
                                        ? "Uang Pas".toUpperCase()
                                        : GFunction.formatCurrency(price),
                                    color:
                                        ctx.selectedDenominationPrice.value ==
                                                price
                                            ? whiteColor
                                            : mainColor,
                                    weight: FontWeight.w600),
                              ),
                            );
                          }),
                        )),
                  ],
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Flexible(
                        child: Container(
                          height: SizeHeight.h32,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: mainColor),
                          ),
                          child: Center(child: CommonText(text: "Batalkan")),
                        ),
                      ),
                      Flexible(
                        child: InkWell(
                          onTap: () => ctx.sendPayment(),
                          child: Container(
                            height: SizeHeight.h32,
                            decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: CommonText(
                                text: "Bayar",
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            );
          }),
    );
  }
}
