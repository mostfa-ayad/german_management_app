import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_management_app/core/colors.dart';
import 'package:german_management_app/core/extentions.dart';

import 'package:german_management_app/product/domain/entities/product.dart';
import 'package:german_management_app/product/presentation/product_bloc/product_bloc.dart';
import 'package:german_management_app/product/presentation/image_cubit/image_cubit_cubit.dart';
import 'package:german_management_app/product/presentation/pages/product_form.dart';
import 'package:german_management_app/core/widget/app_custom_text.dart';

class ProductTile extends StatelessWidget {
  Product product;
  ProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
      child: InkWell(
        onDoubleTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductForm(
                  isEditMode: true,
                  product: product,
                ),
              ));
          BlocProvider.of<ImageCubitCubit>(context).loadImage(product.imageUrl);
        },
        child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      width: context.screenWidth * .25,
                      child: Image.network(product.imageUrl),
                    ),
                  ),
                  SizedBox(
                    width: context.screenWidth * .7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCustomText(text: product.name, size: 25),
                        AppCustomText(
                          text: product.description,
                          size: 15,
                          lines: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppCustomText(
                              text: "${product.price} \$ ",
                              size: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            deleteButton(context)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  IconButton deleteButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Are You Sure To Delete"),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close")),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<ProductBloc>(context)
                        .add(ProductDeleteEvent(docId: product.docId));
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"))
            ],
          ),
        );
      },
      icon: const Icon(Icons.delete_forever_outlined),
      color: Colors.red,
    );
  }
}
