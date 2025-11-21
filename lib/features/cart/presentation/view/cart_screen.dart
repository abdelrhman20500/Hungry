import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/utils/error_dialog.dart';
import 'package:hungry/features/cart/presentation/view/widget/list_cart.dart';
import 'package:hungry/features/cart/presentation/view_manager/cart-state.dart';
import 'package:hungry/features/cart/presentation/view_manager/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartFailure) {
          showErrorDialog(context, state.errMessage);
        } else if (state is CartSuccess) {
          return Column(
            children: [
              ListCart(model: state.cartModel),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Total price",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          state.cartModel.data!.totalPrice ?? '0.00',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff004182),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: height * 0.06,
                      width: width * 0.5,
                      decoration: BoxDecoration(
                        color: const Color(0xff08431D),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            // Add Check Out action here (e.g., navigate to payment)
                          },
                          child: const Text(
                            "Check Out",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is CartInitial) {
          return const Center(child: Text('Loading cart...'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}