import 'package:flutter/material.dart';
import 'package:reselling_new/core/commonfile/app.dart';

class Deliverypartnerspage extends StatefulWidget {
  const Deliverypartnerspage({super.key});

  @override
  State<Deliverypartnerspage> createState() => _DeliverypartnerspageState();
}

class _DeliverypartnerspageState extends State<Deliverypartnerspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(showBack: true, title: "Delivery Partners"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonContainer(
                padding: EdgeInsets.all(10),
                radius: 10,
                height: Screensize.height(context) * 0.1,
                width: double.infinity,
                color: AppColor.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Delivery Partners",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColor.Whitecolor,
                      ),
                    ),
                    Text(
                      "3",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColor.Whitecolor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ScreenContainer(
                context: context,
                imageLink: 'image/imageasstes/wirelessheadphone.png',
                rating: '4.2',
                name: 'Deep',
                areasCover: 'Jaipur',
                ontime: '96%',
                totalDeliveries: '32434',
                codStatus: 'COD Allowed',
              ),
              ScreenContainer(
                context: context,
                imageLink: 'asset/imageassets/manprofile.png',
                rating: '2.0',
                name: 'ketan',
                areasCover: 'Jaipur',
                ontime: '45%',
                totalDeliveries: '3243',
                codStatus: 'no',
              ),
              ScreenContainer(
                context: context,
                imageLink: 'asset/imageassets/manprofile.png',
                rating: '4',
                name: 'sumit',
                areasCover: 'Jaipur',
                ontime: '20%',
                totalDeliveries: '324',
                codStatus: 'not allowed',
              ),
              ScreenContainer(
                context: context,
                imageLink: 'asset/imageassets/manprofile.png',
                rating: '4.2',
                name: 'kishan',
                areasCover: 'Jaipur',
                ontime: '94%',
                totalDeliveries: '3243',
                codStatus: 'COD Allowed',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget codStatusWidget(String value) {
  if (value == "COD Allowed") {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check, color: Colors.white, size: 14),
          SizedBox(width: 4),
          Text(
            "COD Allowed",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  } else {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.close, color: Colors.red, size: 14),
        SizedBox(width: 4),
        Text(
          "COD Not Allowed",
          style: TextStyle(color: Colors.red, fontSize: 12),
        ),
      ],
    );
  }
}

Widget ScreenContainer({
  required BuildContext context,
  required String imageLink,
  required String rating,
  required String name,
  required String areasCover,
  required String ontime,
  required String totalDeliveries,
  required String codStatus,
}) {
  return CommonContainer(
    border: Border.all(color: Colors.grey.shade300),
    width: double.infinity,
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(radius: 40, backgroundImage: AssetImage(imageLink)),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Icon(Icons.star, size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text(rating),
                  ],
                ),
                codStatusWidget(codStatus),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            CommonContainer(
              height: Screensize.height(context) * 0.08,
              width: Screensize.weight(context) * 0.4,
              color: AppColor.primary.withOpacity(0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("On-time Delivery"), Text(ontime)],
              ),
            ),
            SizedBox(width: 10),
            CommonContainer(
              height: Screensize.height(context) * 0.08,
              width: Screensize.weight(context) * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Total Deliveries"), Text(totalDeliveries)],
              ),
            ),
          ],
        ),

        Divider(),
        Row(
          children: [
            Icon(Icons.location_on_outlined, size: 18),
            SizedBox(width: 5),
            Text(areasCover),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: CommonButton(
                OnPressed: () {},
                child: Text("Assign Partner"),
              ),
            ),
            SizedBox(width: 10),
            IconButton.filled(onPressed: () {}, icon: Icon(Icons.call)),
          ],
        ),
      ],
    ),
  );
}
