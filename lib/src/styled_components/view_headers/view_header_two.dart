import 'package:canton_design_system/canton_design_system.dart';

class ViewHeaderTwo extends StatelessWidget {
  final String title;
  final bool backButton;
  final bool isBackButtonClear;
  final Widget buttonOne;
  final Widget buttonTwo;
  final void Function() backButtonFunction;
  const ViewHeaderTwo(
      {this.title,
      this.backButton,
      this.isBackButtonClear,
      this.buttonOne,
      this.buttonTwo,
      this.backButtonFunction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ![null, false].contains(backButton)
            ? CantonBackButton(
                isClear: isBackButtonClear ?? true,
                onPressed: () {
                  backButtonFunction();
                  Navigator.pop(context);
                },
              )
            : buttonOne,
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline5
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        [null, false].contains(backButton)
            ? buttonOne ?? buttonTwo
            : buttonTwo ??
                CantonHeaderButton(
                  backgroundColor: CantonColors.transparent,
                  icon: Container(),
                ),
      ],
    );
  }
}
