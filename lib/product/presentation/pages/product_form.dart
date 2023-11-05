import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_management_app/core/widget/app_text_field.dart';

import 'package:german_management_app/product/domain/entities/product.dart';
import 'package:german_management_app/product/presentation/product_bloc/product_bloc.dart';
import 'package:german_management_app/product/presentation/image_cubit/image_cubit_cubit.dart';

class ProductForm extends StatelessWidget {
  bool isEditMode = false;
  Product? product;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController cost = TextEditingController();
  TextEditingController imageUrl = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  ProductForm({
    super.key,
    required this.isEditMode,
    this.product,
  }) {
    if (isEditMode) {
      name.text = product!.name;
      description.text = product!.description;
      price.text = product!.price.toString();
      cost.text = product!.cost.toString();
      imageUrl.text = product!.imageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Product saved = Product(
                  docId: (isEditMode) ? product!.docId : "",
                  name: name.text,
                  description: description.text,
                  price: double.parse(price.text),
                  cost: double.parse(cost.text),
                  imageUrl: imageUrl.text);
              if (isEditMode) {
                //Edit
                BlocProvider.of<ProductBloc>(context)
                    .add(ProductEditEvent(product: saved));
              } else {
                //SAVE
                BlocProvider.of<ProductBloc>(context)
                    .add(ProductCreateEvent(product: saved));
              }
              if (BlocProvider.of<ProductBloc>(context).state
                  is ProductActionState) {
                Navigator.pop(context);
              }
            },
            icon: Icon((isEditMode) ? Icons.save_as_outlined : Icons.save))
      ], title: Text((isEditMode) ? "Editing Product " : "Create Product")),
      body: _buildBody(context),
    );
  }

  SingleChildScrollView _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: form,
          child: Column(
            children: [
              AppTextField(
                controller: name,
                title: "name",
                textInputType: TextInputType.name,
              ),
              AppTextField(
                controller: description,
                title: "description",
                textInputType: TextInputType.text,
              ),
              AppTextField(
                controller: price,
                title: "price",
                textInputType: TextInputType.number,
              ),
              AppTextField(
                controller: cost,
                title: "cost",
                textInputType: TextInputType.number,
              ),
              AppTextField(
                onChanged: (p0) =>
                    BlocProvider.of<ImageCubitCubit>(context).loadImage(p0),
                controller: imageUrl,
                title: "Image Url",
                textInputType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<ImageCubitCubit, ImageCubitState>(
                  builder: (context, state) {
                    return FadeInImage.assetNetwork(
                        placeholder: "assets/images/loading-gif-png-5.gif",
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset("assets/images/placeholder.jpg"),
                        image:
                            BlocProvider.of<ImageCubitCubit>(context).imageUrl);
                  },
                ),
              )
            ],
          )),
    );
  }
}
