import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/models/line_items.dart';
import 'package:shopping_cart/screens/payment/payment_controller.dart';

import '../../../constant/constant.dart';
import '../../../widgets/widgets.dart';

class LineItemsSection extends GetView<PaymentController> {
  const LineItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: width / 2.4,
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: "Konfirmasi",
                      weight: FontWeight.w800,
                      size: 18,
                    ),
                    CommonText(
                      text: "Order #1",
                      color: blackColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: SizeHeight.h50,
                height: SizeHeight.h50,
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
          Gap(20),
          Divider(),
          Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width / 5,
                child: CommonText(
                  text: "Item",
                  weight: FontWeight.w700,
                ),
              ),
              CommonText(text: "Qty", weight: FontWeight.w700),
              CommonText(text: "Price", weight: FontWeight.w700)
            ],
          ),
          Gap(10),
          Divider(),
          GetBuilder<PaymentController>(
            init: PaymentController(),
            builder: (ctx) {
              return Column(
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: ctx.items.length,
                      itemBuilder: (context, index) {
                        LineItems data = ctx.items[index];

                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width / 5.5,
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: mainColor,
                                      radius: 18,
                                      child: CommonText(
                                        text: GFunction.setCharName(
                                            data.productName),
                                        color: whiteColor,
                                      ),
                                    ),
                                    Gap(10),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonText(
                                            text: data.productName,
                                            color: blackColor,
                                            weight: FontWeight.w700,
                                            size: FontSize.f12,
                                          ),
                                          CommonText(
                                            text: GFunction.formatCurrency(
                                                data.price!),
                                            color: greyColor,
                                            weight: FontWeight.w700,
                                            size: FontSize.f12,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 10,
                                children: [
                                  InkWell(
                                    onTap: () => ctx.removeItem(index),
                                    child: Container(
                                      height: SizeHeight.h32,
                                      width: SizeHeight.h32,
                                      decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Icon(
                                        Icons.remove,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                  CommonText(
                                    text: "${data.quantity}",
                                  ),
                                  InkWell(
                                    onTap: () => ctx.addItem(index),
                                    child: Container(
                                      height: SizeHeight.h32,
                                      width: SizeHeight.h32,
                                      decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Icon(
                                        Icons.add,
                                        color: whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 80,
                                child: CommonText(
                                  text: GFunction.formatCurrency(
                                    data.price! * data.quantity!,
                                  ),
                                  weight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 100,
                    children: [
                      Column(
                        spacing: 10,
                        children: [
                          Container(
                            width: SizeHeight.h50,
                            height: SizeHeight.h50,
                            decoration: BoxDecoration(
                                border: Border.all(color: mainColor),
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.discount,
                              color: mainColor,
                            ),
                          ),
                          CommonText(text: "Diskon")
                        ],
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          Container(
                            width: SizeHeight.h50,
                            height: SizeHeight.h50,
                            decoration: BoxDecoration(
                                border: Border.all(color: mainColor),
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.percent,
                              color: mainColor,
                            ),
                          ),
                          CommonText(text: "Pajak")
                        ],
                      ),
                      Column(
                        spacing: 10,
                        children: [
                          Container(
                            width: SizeHeight.h50,
                            height: SizeHeight.h50,
                            decoration: BoxDecoration(
                                border: Border.all(color: mainColor),
                                borderRadius: BorderRadius.circular(8)),
                            child: Icon(
                              Icons.store,
                              color: mainColor,
                            ),
                          ),
                          CommonText(text: "Layanan")
                        ],
                      ),
                    ],
                  ),
                  Gap(15),
                  Divider(),
                  Gap(15),
                  Column(
                    spacing: 20,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: "Sub total",
                            color: blackColor,
                          ),
                          CommonText(
                            text: GFunction.formatCurrency(ctx.subTotal),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CommonText(
                            text: "Total",
                            color: blackColor,
                            size: FontSize.f18,
                            weight: FontWeight.w700,
                          ),
                          CommonText(
                            text: GFunction.formatCurrency(ctx.subTotal),
                            size: FontSize.f18,
                            weight: FontWeight.w700,
                          )
                        ],
                      )
                    ],
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
