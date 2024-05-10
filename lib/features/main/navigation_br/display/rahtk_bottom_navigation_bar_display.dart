class RahtkBottomNavigationBarDisplay {
  final String title;
  final void Function() onTap;
  final String iconPath;

  const RahtkBottomNavigationBarDisplay({
    required this.title,
    required this.onTap,
    required this.iconPath,
  });
}
