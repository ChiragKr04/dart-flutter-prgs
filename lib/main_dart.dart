class Room {
  late int roomNo;
  late String roomType;
  late double roomArea;
  late bool hasAcMachine;

  void setData(int no, String type, double area, bool ac) {
    roomNo = no;
    roomType = type;
    roomArea = area;
    hasAcMachine = ac;
  }

  void displayData() {
    print("Room Number: $roomNo");
    print("Room Type: $roomType");
    print("Room Area: $roomArea sq.ft");
    print("AC Machine: $hasAcMachine");
  }
}

void main() {
  Room room1 = Room();
  Room room2 = Room();

  room1.setData(101, "Single", 200.0, true);
  room2.setData(202, "Double", 300.0, false);

  room1.displayData();
  print("\n");
  room2.displayData();
}
