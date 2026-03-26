import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/commonfile/commonicon.dart';
import '../../../../../../../core/commonstyle/colorstyle.dart';
import '../../../../../../../core/commonstyle/sizes.dart';
import '../../../../../../../core/commonwidget/commoncontainer.dart';
import '../../../../../hometextfile.dart';
import '../../../../../viewmodel/datauplodeprovider.dart';

class ProductImageUpload extends StatelessWidget {
  const ProductImageUpload({super.key});
  @override
  Widget build(BuildContext context) {
    final picker = ImagePicker();
    return Consumer<Datauplodeprovider>(
      builder: (context, provider, child) {
        return CommonContainer(
          padding: EdgeInsets.all(AppSize.paddingMd),
          // height: Screensize.height(context) * 0.2,
          width: double.infinity,
          color: AppColor.ContainerColor,
          border: Border.all(color: Colors.grey.shade300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppTextFile.ProductImage),
              SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.selectedImages.length < 5
                      ? provider.selectedImages.length + 1
                      : provider.selectedImages.length,
                  itemBuilder: (context, index) {
                    if (provider.selectedImages.length < 5 && index == 0) {
                      return uploadButton(context, picker, provider);
                    }

                    final imageIndex = provider.selectedImages.length < 5
                        ? index - 1
                        : index;

                    final image = provider.selectedImages[imageIndex];
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              provider.removeImage(imageIndex);
                            },
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.close,
                                size: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              if (provider.imageerror != null)
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    provider.imageerror!,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget uploadButton(context, picker, provider) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final XFile? file = await picker.pickImage(
                          source: ImageSource.camera,
                        );
                        if (file != null) {
                          provider.addImage(File(file.path), context);
                        }
                        Navigator.pop(context);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [Icon(Commonicon.camraicon), Text("Camera")],
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () async {
                        final XFile? file = await picker.pickImage(
                          source: ImageSource.gallery,
                        );
                        if (file != null) {
                          provider.addImage(File(file.path), context);
                        }
                        Navigator.pop(context);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Commonicon.galleryicon),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Commonicon.fileupload), Text("Upload")],
        ),
      ),
    );
  }
}
