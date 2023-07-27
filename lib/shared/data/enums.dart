enum Tag { recommended, trending, novels, nature, other }

extension EnumExtension on Enum {
  String capitalizedName() {
    return name[0].toUpperCase() + name.substring(1);
  }
}
