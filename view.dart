import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:obuna/helpers/ValidatorHelper.dart';
import '../../../widgets/CustomInput.dart';
import '../controllers/controller.dart';

class PaymentPage extends GetView<PaymentController> {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("data"),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Container(
                    height: 380,
                    constraints: const BoxConstraints(
                      maxWidth: 400,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(height: 8),
                            CustomInput(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(
                                  "assets/icons/card.svg",
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              title: "card_number".tr,
                              controller: controller.cardController,
                              hint: '---- ---- ---- ----'.tr,
                              filled: true,
                              inputFormatters: [ValidatorHelper().maskFormatterCard],
                              onChanged: (v) {
                                controller.cardNumber.value = v;
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomInput(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(
                                  "assets/icons/date.svg",
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              title: "best_before_date".tr,
                              controller: controller.dateController,
                              hint: 'mm_yy'.tr,
                              inputFormatters: [ValidatorHelper().maskFormatterCardData],
                              onChanged: (v) {
                                controller.cardDate.value = v;
                              },
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                backgroundColor: const Color(0xFFfd0015),
                              ),
                              onPressed: () {
                                // sendCardInfo();
                              },
                              child: Text(
                                'send'.tr,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -100,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 320,
                      ),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: const Offset(0, 10),
                          ),
                        ],
                        gradient: const LinearGradient(
                          transform: GradientRotation(18),
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [0.2, 0.4, 0.68, 0.8],
                          colors: [
                            Color(0xFFfd0015),
                            Colors.pink,
                            Color(0xFF7e287d),
                            Color(0xFF4d1e74),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Icon(
                                  Icons.sim_card,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              Text(
                                controller.cardNumber.value.isNotEmpty ? controller.cardNumber.value : '---- ---- ---- ----'.tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "${"validity_period".tr}\n${controller.cardDate.value.isNotEmpty ? controller.cardDate.value : 'mm_yy'.tr}",
                                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            AcceptReject(
              assetName: "assets/icons/approve.svg",
            ),

          ],
        ),
      ),
    );
  }
}

class AcceptReject extends StatelessWidget {
  final String assetName;

  const AcceptReject({
    super.key,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
      return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Column(
            children: [
              SvgPicture.asset("assets/icons/approve.svg"),
              const SizedBox(height: 40),
              const Text("data", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              const Text("text", style: TextStyle(fontSize: 14, color: Color(0xFF65656e), fontWeight: FontWeight.w500)),
              const SizedBox(height: 100),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  onPressed: () {
                    // sendCardInfo();
                  },
                  child: Text(
                    'send'.tr,
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
