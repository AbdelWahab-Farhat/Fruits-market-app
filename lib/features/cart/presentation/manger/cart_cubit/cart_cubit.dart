import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/cart.dart';
import '../../../data/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  List<Cart> cartItems = [];

  CartCubit(this.cartRepo) : super(CartInitial());

  Future<void> fetchCustomerCart() async {
    emit(CartLoading());
    var result = await cartRepo.fetchCustomerCart();
    result.fold((failure) {
      emit(CartFailure(errMessage: failure.errMessage));
    }, (items) {
      cartItems = items!;
      emit(CartSuccess());
    });
  }

  Future<void> removeItemFromCart(Cart cart) async {
    emit(CartLoading());
    cartItems.remove(cart);
    var result = await cartRepo.removeItemFromCart(cart);
    result.fold((failure) {
      emit(CartFailure(errMessage: failure.errMessage));
    }, (_) {
      emit(CartSuccess(message: 'Removed Successfully'));
    });
  }



  Future<void> updateQuantity(Cart cartItem) async {
    var result = await cartRepo.updateQuantity(cartItem);
    result.fold((failure) {
      emit(CartFailure(errMessage: failure.errMessage));
    }, (_) {
      emit(CartSuccess());
    });
  }

  Future<void> quantityDecrement(Cart item) async {
    if (item.quantity <= 1) {
      return;
    }
    item.quantity--;
    emit(CartSuccess());
    updateQuantity(item);
  }
  Future<void> quantityIncrement(Cart item) async {
    if (item.quantity > 100) {
      return;
    }
    item.quantity++;
    cartItems.map((e) {
      if (e.ID == item.ID) {
        e.quantity = item.quantity;
      }
    },);
    emit(CartSuccess());
    updateQuantity(item);
  }
}

