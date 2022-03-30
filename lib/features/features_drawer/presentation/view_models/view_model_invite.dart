import '../../../../core/UI/presentation/view_model_base.dart';
import '../../../../core/utils/utilities_general.dart';

class InviteViewModel extends BaseViewModel {
  void copyToClipBoard(String data) => GeneralUtils.copyToClipBoard(data);
}
