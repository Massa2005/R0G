class printdebug{
  static void printYellow(String msg){
    String a = "";
    for (var line in msg.split("\n")) {
      a+="\x1B[33m$line\x1B[0m\n";
    }
    print(a);
}
}
