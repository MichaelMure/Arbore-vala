public class Ab_Key_Test : Object {

  private static Ab_Key zero;
  private static Ab_Key one;
  private static Ab_Key ten;
  private static Ab_Key two;
  private static Ab_Key half;
  private static Ab_Key max;

  public static void init() {
    zero = new Ab_Key.from_array({0,0,0,0,0});
    one = new Ab_Key.from_array({1,0,0,0,0});
    ten = new Ab_Key.from_array({10,0,0,0,0});
    two = new Ab_Key.from_array({2,0,0,0,0});
    half = new Ab_Key.Key_Half();
    max = new Ab_Key.Key_Max();
  }

  public static void test_is_null () {
    assert(zero.is_null());
    assert(!one.is_null());
    assert(!ten.is_null());
    assert(!two.is_null());
    assert(!half.is_null());
    assert(!max.is_null());
  }

  public static void test_equals () {
    assert(ten.equals(ten));
    assert(two.equals(two));
    assert(half.equals(half));
    assert(max.equals(max));
    assert(!(ten.equals(two)));
    assert(!(ten.equals(two)));
    assert(!(half.equals(max)));
    assert(!(max.equals(half)));
  }

  public static void test_plus () {
    assert (ten.plus(two).equals(new Ab_Key.from_array({12,0,0,0,0})));
    assert (half.plus(half).equals(max.minus(one))); // -1, because rounding of key half
    assert (half.plus(two).equals(new Ab_Key.from_array({1,0,0,0,(uint32)0x80000000})));
  }

  public static void test_minus () {
    assert (ten.minus(two).equals(new Ab_Key.from_array({8,0,0,0,0})));
    assert (half.minus(half).equals(zero));
    assert (half.minus(two).equals(new Ab_Key.from_array({(uint32)0xFFFFFFFD,
                                                          (uint32)0xFFFFFFFF,
                                                          (uint32)0xFFFFFFFF,
                                                          (uint32)0xFFFFFFFF,
                                                          (uint32)0x7FFFFFFF})));
  }

  public static void test_dump () {
    uint8[] half = {FF, FF, FF, FF, FF, FF, FF, FF, FF, FF,
                    FF, FF, FF, FF, FF, FF, 7F, FF, FF, FF};

    uint8[] buffer = new uint8[half.serialized_size()];
    half.dump(ref buffer);
    Ab_ArrayPrinter.printArray(ref buffer);
  }

  public static void main (string[] args) {
    Test.init (ref args);
    Ab_Key_Test.init();
    Test.add_func ("/key/is_null", test_is_null);
    Test.add_func ("/key/equals", test_equals);
    Test.add_func ("/key/add", test_plus);
    Test.add_func ("/key/minus", test_minus);
    Test.add_func ("/key/dump", test_dump);
    Test.run ();
  }
}
