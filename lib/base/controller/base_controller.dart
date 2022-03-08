import 'dart:async';

import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:get/get.dart';
import 'package:open_eye/ext/get_extension.dart';
import 'package:open_eye/http/app_except.dart';
import 'package:open_eye/http/result/base_result.dart';
import 'package:open_eye/http/result/base_wan_result.dart';
import 'package:open_eye/mixin/toast/toast_mixin.dart';
import 'package:open_eye/utils/log_utils.dart';

///具有状态控制和网络请求能力的controller，等价MVVM中的ViewModel
abstract class BaseController<M> extends SuperController with ToastMixin {
  late M api;
  late EventBus eventBus;
  List<StreamSubscription>? _stremSubList;
  RxString barTitleString = "标题".obs;

  @override
  void onInit() {
    super.onInit();
    LogD('>>>>>>>onInit');
  }

  void loadNet();

  /// 发起网络请求，同时处理异常，loading
  httpRequest<T>(Future<T> future, FutureOr<dynamic> Function(T value) onValue,
      {Function(Exception e)? error,
      bool showLoading = false,
      bool handleError = true,
      bool handleSuccess = true}) {
    if (showLoading) {
      Get.showLoading();
    }
    future.then((t) {
      ///添加结果码判断（同时考虑加入List的判断逻辑）
      if (t is BaseWanResult) {
        baseWanResultHandler(t, handleSuccess, onValue, handleError);
      } else if (t is BaseResult) {
        baseResultHandler(t, handleSuccess, onValue, handleError);
      } else {
        if (handleSuccess) {
          showSuccess();
        }
        onValue(t);
      }
    }).catchError((e) {
      LogE("网络请求异常====>error:$e");
      if (handleError) {
        showError(e: e);
      }
      if (error != null) {
        error(e);
      }
      showToast(e.toString());
    }).whenComplete(() {
      if (showLoading) {
        Get.dismiss();
      }
    });
  }

  ///多网络请求简单封装
  multiHttpRequest(List<Future<dynamic>> futures,
      FutureOr<dynamic> Function(dynamic value) onValue,
      {Function(Exception e)? error,
      bool showLoading = false,
      bool handleError = true,
      bool handleSuccess = true}) async {
    if (showLoading) {
      Get.showLoading();
    }
    Future.wait(futures).then((value) {
      onValue(value);
    }).catchError((e) {
      LogE("网络请求异常====>error:$e");
      if (handleError) {
        showError(e: e);
      }
      if (error != null) {
        error(e);
      }
      showToast(e.toString());
    }).whenComplete(() {
      if (showLoading) {
        Get.dismiss();
      }
    });
  }

  ///大阳智投接口处理
  void baseResultHandler<T>(t, bool handleSuccess,
      FutureOr<dynamic> Function(T value) onValue, bool handleError) {
    if ("1" == t.resCode) {
      if (handleSuccess) {
        showSuccess();
      }
      onValue(t);
    } else {
      if (handleError) {
        showToast(t.resMessage);
        showError(errorMessage: t.resMessage);
      } else {
        onValue(t);
        if (handleSuccess) {
          showSuccess();
        }
      }
    }
  }

  /// WanAndroid接口处理
  void baseWanResultHandler<T>(t, bool handleSuccess,
      FutureOr<dynamic> Function(T value) onValue, bool handleError) {
    if (t.errorCode == 0) {
      if (handleSuccess) {
        showSuccess();
      }
      onValue(t);
    } else {
      if (handleError) {
        showToast(t.errorMsg);
        showError(errorMessage: t.errorMsg);
      } else {
        onValue(t);
        if (handleSuccess) {
          showSuccess();
        }
      }
    }
  }

  @override
  void onDetached() {
    LogD('>>>>>>>onDetached');
  }

  @override
  void onInactive() {
    LogD('>>>>>>>onInactive');
  }

  @override
  void onPaused() {
    LogD('>>>>>>>onPaused');
  }

  @override
  void onResumed() {
    LogD('>>>>>>>onResumed');
  }

  @override
  void onReady() {
    super.onReady();
    LogD('>>>>>>>onReady');
    if (useEventBus()) {
      eventBus = Get.find<EventBus>();
    }
    try {
      api = Get.find<M>();
    } catch (e) {
      LogE(e.toString());
    }
    // loadNet();
  }

  @override
  void onClose() {
    super.onClose();
    //解订阅EventBus
    disposeEventBus();
    LogD('>>>>>>>onClose');
  }

  ///解订阅StreamSubscription--关联EventBus
  void disposeEventBus() {
    _stremSubList?.forEach((element) {
      element.cancel();
    });
  }

  void showSuccess() {
    change(null, status: RxStatus.success());
  }

  void showEmpty() {
    change(null, status: RxStatus.empty());
  }

  void showError({String? errorMessage, Exception? e}) {
    if (e != null) {
      if (e is DioError && e.error is AppException) {
        var error = e.error as AppException;
        change(null, status: RxStatus.error(error.message));
      } else {
        change(null, status: RxStatus.error(errorMessage));
      }
    } else {
      change(null, status: RxStatus.error(errorMessage));
    }
  }

  void showLoading() {
    change(null, status: RxStatus.loading());
  }

  ///是否使用GetX查找EventBus
  bool useEventBus() => false;

  ///管理Eventbus解订阅
  void addStremSub(StreamSubscription? streamSubscription) {
    _stremSubList ??= [];
    if (streamSubscription != null) {
      _stremSubList?.add(streamSubscription);
    }
  }
}
