import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../core/commonfile/commonicon.dart';
import '../../../../../../../../core/commonfile/screensize.dart';
import '../../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../../core/commonwidget/commonbutton.dart';
import '../../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../../../../core/commonwidget/commontextformfiled.dart';
import '../../../../../../../homepage/hometextfile.dart';
import '../backaclist.dart';
import 'addbankaccount.dart';

class Withdrowfromwidget extends StatefulWidget {
  const Withdrowfromwidget({super.key});
  @override
  State<Withdrowfromwidget> createState() => _WithdrowfromwidgetState();
}

class _WithdrowfromwidgetState extends State<Withdrowfromwidget> {
  final TextEditingController amountController = TextEditingController();
  int tabselection = 0;
  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Commontextformfiled(
          controller: amountController,
          obscureText: false,
          prefixIcon: Commonicon.moneyicon,
          hint: AppTextFile.EnterAmount,
          Keywordtype: TextInputType.numberWithOptions(),
        ),
        Text(
          AppTextFile.Minimaxwithdrow,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.grey.shade500,
            fontSize: 13,
          ),
        ),
        SizedBox(height: AppSize.spacingLg),
        Text(
          AppTextFile.WithdrawalMethod,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                padding: const EdgeInsets.only(top: AppSize.paddingSm),
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.black,
                isScrollable: false,
                onTap: (index) {
                  setState(() {
                    tabselection = index;
                  });
                },
                labelColor: Colors.white,
                unselectedLabelStyle: TextStyle(color: Colors.black),
                indicator: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                tabs: [
                  CommonContainer(
                    height: Screensize.height(context) * 0.09,
                    width: double.infinity,
                    border: Border.all(
                      color: tabselection == 1
                          ? AppColor.primary
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Commonicon.BankAc, size: 20),
                          Text(
                            AppTextFile.BankTransfer,
                            style: tabselection == 0
                                ? Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(color: AppColor.Whitecolor)
                                : TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CommonContainer(
                    height: Screensize.height(context) * 0.09,
                    width: double.infinity,
                    border: Border.all(
                      color: tabselection == 0
                          ? AppColor.primary
                          : Colors.transparent,
                    ),
                    child: Center(
                      child: Text(
                        AppTextFile.UPI,
                        style: tabselection == 1
                            ? Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColor.Whitecolor,
                              )
                            : TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Tabbar(tabselectionindex: tabselection),
            ],
          ),
        ),
      ],
    );
  }
}

class Tabbar extends StatefulWidget {
  final int tabselectionindex;
  const Tabbar({super.key, required this.tabselectionindex});
  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int seletedindex = 0;
  @override
  Widget build(BuildContext context) {
    final banks = BankDummyData.bankList;
    return SizedBox(
      height: widget.tabselectionindex == 0
          ? Screensize.height(context) * 0.39
          : Screensize.height(context) * 0.18,
      child: IndexedStack(
        index: widget.tabselectionindex,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppTextFile.SelectBankAc),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: BankDummyData.bankList.length,
                  itemBuilder: (context, index) {
                    final bank = banks[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          seletedindex = index;
                        });
                      },
                      child: CommonContainer(
                        padding: EdgeInsets.all(AppSize.paddingSm),
                        margin: EdgeInsets.only(
                          top: Screensize.height(context) * 0.01,
                        ),
                        height: Screensize.height(context) * 0.1,
                        width: double.infinity,
                        border: Border.all(
                          color: seletedindex == index
                              ? AppColor.primary
                              : Colors.grey.shade300,
                        ),
                        color: AppColor.Whitecolor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: AppSize.spacingSm),
                            Row(
                              children: [
                                Icon(Commonicon.BankAc, size: 20),
                                SizedBox(width: AppSize.spacingSm),
                                Text(
                                  bank.bankName,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Spacer(),
                                if (bank.isPrimary)
                                  CommonContainer(
                                    radius: 5,
                                    height: Screensize.height(context) * 0.03,
                                    width: Screensize.weight(context) * 0.2,
                                    color: Colors.green,
                                    child: Center(
                                      child: Text(
                                        "Default",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(
                              height: Screensize.height(context) * 0.005,
                            ),

                            Text(
                              "Ac:- *****${bank.accountNumber.substring(bank.accountNumber.length - 3)}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: Screensize.height(context) * 0.009),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: DottedBorder(
                  strokeWidth: 1.5,
                  dashPattern: const [6, 3],
                  radius: const Radius.circular(10),
                  padding: EdgeInsets.all(2),
                  borderType: BorderType.RRect,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Addbankaccount(),
                        ),
                      );
                    },
                    child: CommonContainer(
                      height: Screensize.height(context) * 0.054,
                      radius: 10,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Commonicon.addicon),
                          Text(AppTextFile.Addnewbankac),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Screensize.height(context) * 0.01),
              CommonButton(
                OnPressed: () {},
                widht: double.infinity,
                child: Text(AppTextFile.Requestpayout),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("UPI ID"),
              SizedBox(height: AppSize.spacingSm),
              Commontextformfiled(
                controller: TextEditingController(),
                obscureText: false,
                hint: "JhonLuter238@Paytm",
              ),
              SizedBox(height: Screensize.height(context) * 0.01),
              CommonButton(
                OnPressed: () {},
                widht: double.infinity,
                child: Text(AppTextFile.Requestpayout),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
