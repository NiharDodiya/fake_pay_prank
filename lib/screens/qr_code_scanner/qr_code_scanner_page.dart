import 'dart:developer';
import 'dart:io';
import 'package:fake_pay_prank/common/common_function.dart';
import 'package:fake_pay_prank/screens/go_to_fake_pay/account_holder_detail/account_holder_detail_screen.dart';
import 'package:fake_pay_prank/screens/onbording/onboarding_second/onboarding_second_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

/*class QrCodeScannerPage extends StatefulWidget {
  const QrCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<QrCodeScannerPage> createState() => _QrCodeScannerPageState();
}

class _QrCodeScannerPageState extends State<QrCodeScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}*/

class QRViewPage extends StatefulWidget {
  const QRViewPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewPageState();
}

class _QRViewPageState extends State<QRViewPage> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
// @override
  // void initState() {
  //   controller!.pauseCamera();
  //   super.initState();
  // }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1),(){
      if (Platform.isAndroid) {
        controller!.pauseCamera();
      }
      controller!.resumeCamera();
    });
    setState(() {

    });
    super.initState();
  }
  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     controller!.pauseCamera();
  //   }
  //   controller!.resumeCamera();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 3, child: _buildQrView(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 300.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
    this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      if (result != null) {
        setState(() {
          qRResult = "";
          qRResult = result!.code.toString();
        });
        print("BARCODE DATA : ${result!.code}");
        getName(result!.code.toString());
        Get.to(AccountHolderDetailScreen(fromScannerPage: true,));
      } else {
        print("Result is null");
      }
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

// class ScanQrCode extends StatelessWidget {
//   const ScanQrCode({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<ScanQrCodeViewScreen>.reactive(
//         viewModelBuilder: () => ScanQrCodeViewScreen(),
//         onModelReady: (model) {
//           model.init();
//         },
//         onDispose: (model) {
//           model.dispose();
//         },
//         builder: (context, model, child) {
//           return Scaffold(
//             body: !model.qrPage
//                 ? Container(
//               height: Get.height,
//               width: Get.width,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: Get.height * 0.11,
//                   ),
//                   //qr scanner logo
//                   Container(
//                     height: 90,
//                     width: 90,
//                     child: Image.asset(AssetRes.qrcode),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(AppRes.scanQRCode,
//                       style: AppTextStyle(
//                           color: ColorRes.red,
//                           size: 33,
//                           weight: FontWeight.w600)),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     AppRes.atYourTableOrSeat,
//                     style: AppTextStyle(
//                         color: ColorRes.red,
//                         size: 18,
//                         weight: FontWeight.w600),
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.13,
//                   ),
//                   //open camera
//                   InkWell(
//                     onTap: () {
//                       model.show();
//                     },
//                     child: Container(
//                       height: 35,
//                       width: Get.width * 0.6,
//                       decoration: BoxDecoration(
//                           color: ColorRes.green,
//                           borderRadius:
//                           BorderRadius.all(Radius.circular(10)),
//                           border: Border.all(color: ColorRes.green)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(
//                             Icons.camera_alt_rounded,
//                             color: ColorRes.white,
//                           ),
//                           SizedBox(
//                             width: Get.width * 0.03,
//                           ),
//                           Text(
//                             AppRes.openCamera,
//                             style: AppTextStyle(
//                                 color: ColorRes.white,
//                                 size: 18,
//                                 weight: FontWeight.w600),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: Get.height * 0.13,
//                   ),
//                   Text(
//                     AppRes.thisIsWhereYourDrinks,
//                     style: AppTextStyle(
//                         color: ColorRes.gray,
//                         size: 18,
//                         weight: FontWeight.w500),
//                   ),
//                   Text(
//                     AppRes.willBeDeliveredTo,
//                     style: AppTextStyle(
//                         color: ColorRes.gray,
//                         size: 18,
//                         weight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//             )
//                 : QRView(
//               key: model.qrKey,
//               onQRViewCreated: model.onQRViewCreated,
//             ),
//           );
//         });
//   }
// }
//
// class ScanQrCodeViewScreen extends BaseViewModel {
//   void init() {}
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;
//
//   bool qrPage = false;
//
//   void reassemble() {
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }
//
//   void onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       result = scanData;
//       notifyListeners();
//     });
//   }
//
//   void show() {
//     Get.to(() => QRViewPage());
//     // Get.to(()=>QrViewScreen());
//   }
//
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }
