part of './login_view.dart';

class _LoginLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Get.width * 0.7,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}