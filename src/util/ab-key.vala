/*
 * Copyright(C) 2008 Laurent Defert, Romain Bignon
 * Copyright(C) 2012 Michael Muré <batolettre@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */

using Gee;

public class Ab_Key : GLib.Object {

  /** Size of the Key in bits */
  public static const uint32 KEY_SIZE = 160;
  /** Size of the hexa representation of the key in char */
  public static const uint32 HEXA_KEYLENGTH = KEY_SIZE / 4;
  /** Size of the key in uint32 */
  /* https://bugzilla.gnome.org/show_bug.cgi?id=663887 prevent the next lines
  private static const uint32 NLEN = (KEY_SIZE / (8 * sizeof(uint32))); */
  private static const uint32 NLEN = (KEY_SIZE / (8 * 4));

  /** Default constructor: create a null key. */
  public Ab_Key() {
    for(int i = 0; i < NLEN; i++) {
      t[i] = 0;
    }
  }

  /** Constructor for a random key. */
  public Ab_Key.random () {
    for(int i = 0; i < NLEN; i++) {
      t[i] = Random.next_int();
    }
  }

  /** Constructor from an array */
  public Ab_Key.from_array (uint32[] array)
    requires (array.length == NLEN)
  {
    t = array;
  }

  /** Constructor for Key_Max, the biggest key available */
  public Ab_Key.Key_Max () {
    for(int i = 0; i < NLEN; i++) {
      t[i] = uint32.MAX;
    }
  }

  /** Constructor for Key_Half, the half biggest key */
  public Ab_Key.Key_Half () {
    for(int i = 0; i < NLEN; i++) {
      t[i] = uint32.MAX;
    }
    t[NLEN-1] /= 2;
  }


  public string to_string() {
    string str = "";
    for(int i = (int) NLEN - 1; i >= 0; i--) {
      str += "%08X".printf(t[i]);
    }
    return str;
  }

  public void dump(ref char[] buffer) {

  }

  /* @return the size in octet of a serialized key */
  public static ulong serialized_size() {
    return KEY_SIZE;
  }

  /** Comparaison between two keys.
   *
   * @param k other key which is compared to.
   * @return true if two keys are equals.
   */
  public bool equals(Ab_Key k) {
    for(int i = 0; i < NLEN; i++) {
      if (t[i] != k.t[i])
        return false;
    }
    return true;
  }

  /** Comparaison with an other key.
   *
   * @param k other key which is compared to.
   * @return true if I'm superior than k2.
   */
  public bool is_greater_than(Ab_Key k) {
    for(int i = 0; i < NLEN; i++) {
      if (t[i] > k.t[i])
        return true;
      else if (t[i] < k.t[i])
        return false;
    }
    return false;
  }

  /** Comparaison with an other key.
   *
   * @param k other key which is compared to.
   * @return true if I'm smaller than k2.
   */
  public bool is_smaller_than(Ab_Key k) {
    for(int i = 0; i < NLEN; i++) {
      if (t[i] < k.t[i])
        return true;
      else if (t[i] > k.t[i])
        return false;
    }
    return false;
  }

  /** Check if the key is null.
   * @return true if the key is equal to 0.
   */
  public bool is_null() {
    for(int i = 0; i < NLEN; i++) {
      if (t[i] > 0)
        return true;
    }
    return false;
  }

  /** @return the sum of this and k */
  public Ab_Key plus(Ab_Key k) {
    uint32[] result = new uint32[NLEN];
    uint64 tmp = 0;

    for(int i = 0; i < NLEN; i++) {
      tmp += t[i] + k.t[i];
      if(tmp <= uint32.MAX) {
        result[i] = (uint32) tmp;
        tmp = 0;
      }
      else {
        result[i] = uint32.MAX;
        tmp -= uint32.MAX;
      }
    }

    return new Ab_Key.from_array(result);
  }

  /** @return the diffence of this and k, ie (this-k). */
  public Ab_Key minus(Ab_Key k) {
    //uint32[] result = new uint32[NLEN];

    return new Ab_Key();
  }

  /** Calculate the midpoint for this
   *
   * @return this +/- Key_Half
   */
  public Ab_Key midpoint() {
    Ab_Key half = new Ab_Key.Key_Half();

    if (this.is_smaller_than(half))
      return this.plus(half);
    else
      return this.minus(half);
  }

  /** Calculate the lenght of the longest prefix match between this and a key
   *
   * @param k Key that you wan't compare prefix with this
   * @return size of the prefix match
   */
  public uint32 key_index(Ab_Key k) {
    /* TODO */
    return 0;
  }




  /** Internal storage of the key. Higher index is the highly significant part of the key. */
  private uint32[] t = new uint32[NLEN];
}
