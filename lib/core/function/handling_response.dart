import 'package:bea_shop/core/utrlis/api/request_state.dart';

handleResponse(response) {
  if (response is RequestState) {
    return response;
  } else {
    return RequestState.loaded;
  }
}
