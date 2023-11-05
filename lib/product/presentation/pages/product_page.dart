import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:german_management_app/core/widget/app_snack_bar.dart';
import 'package:german_management_app/product/presentation/product_bloc/product_bloc.dart';
import 'package:german_management_app/product/presentation/image_cubit/image_cubit_cubit.dart';
import 'package:german_management_app/product/presentation/pages/product_form.dart';
import 'package:german_management_app/product/presentation/widgets/product_tile.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductLoadListgEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<ProductBloc>(context)
                    .add(ProductLoadListgEvent());
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductActionState) {
            showAppSnackBar(context, state.msg);
            BlocProvider.of<ProductBloc>(context).add(ProductLoadListgEvent());
          }
          if (state is ProductErrorState) {
            showAppSnackBar(context, state.msg);
          }
        },
        builder: (context, state) {
          return BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoadListState) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    return ProductTile(product: state.list[index]);
                  },
                );
              } else if (state is ProductLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text("Error"),
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<ImageCubitCubit>(context).loadImage("");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductForm(isEditMode: false),
                ));
          },
          child: const Icon(Icons.add)),
    );
  }
}
