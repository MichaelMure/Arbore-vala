public class Ab_Packet_Test : Object {

  public static void test_dummy () {
    
    assert (true);
  }

  public static void main (string[] args) {
    Test.init (ref args);
    Test.add_func ("/packet/dummy", test_dummy);
    Test.run ();
  }
}
