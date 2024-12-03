import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:share_way_frontend/presentation/payment_method/models/payment_method.dart';

part 'payment_method_state.g.dart';

@CopyWith()
class PaymentMethodState {
  final bool isLoading;
  final bool dataChange;
  final List<PaymentMethod> paymentMethods;
  final int selectedPaymentMethod;

  PaymentMethodState({
    this.isLoading = false,
    this.dataChange = false,
    this.paymentMethods = const [],
    this.selectedPaymentMethod = 0,
  });
}