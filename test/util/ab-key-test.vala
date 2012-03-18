public class Ab_Key_Test : Object {

  public static void test_add () {
    Ab_Key max = new Ab_Key.Key_Max();
    Ab_Key half = new Ab_Key.Key_Half();
    
    assert (max.is_greater_than(half));
  }

  public static void main (string[] args) {
    Test.init (ref args);
    Test.add_func ("/key/add", test_add);
    Test.run ();
  }
}
