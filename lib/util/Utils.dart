String getThemeName(String path) {
  return path.substring(path.lastIndexOf("/") + 1, path.lastIndexOf("."));
}