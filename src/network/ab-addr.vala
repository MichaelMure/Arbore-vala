/*
 * Copyright(C) 2008 Romain Bignon
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

/** This class holds an adress of a host and it's key. */
public class Ab_Addr : GLib.Object {

  /** Default constructor */
  public Ab_Addr () {
    key = new Ab_Key();
    inet_addr = new InetSocketAddress(new InetAddress.any(SocketFamily.IPV6), 0);
  }

  /** Constructor from an InetSocketAddress.
   * The key is null */
  public Ab_Addr.inet (InetSocketAddress addr) {
    key = new Ab_Key();
    inet_addr = addr;
  }

  /** Full constructor, with an InetSocketAddress and a key. */
  public Ab_Addr.full (InetSocketAddress addr, Ab_Key key) {
    this.key = key;
    this.inet_addr = addr;
  }

  public InetSocketAddress inet_addr { get; set; }
  public Ab_Key key { get; set; }

  /** Serialize into the provided buffer */
  public void dump(ref uint8[] buffer) {

  }

  /** @return the serialized size of this object, in octet */
  public uint32 serialized_size() {
    return 0;
  }

  /** Comparaison between two Ab_Addr.
   *
   * @param other other Ab_Addr which is compared to.
   * @return true if two Ab_Addr are equals.
   */
  public bool equal(Ab_Addr other) {
    if(!key.equals(other.key))
      return false;
    if(!inet_addr.address.equal(other.inet_addr.address))
      return false;
    if(inet_addr.port != other.inet_addr.port)
      return false;
    return true;
  }

  /** @return the textual representation of this, for debugging purpose */
  public string to_string() {
    return @"$key:$(inet_addr.address):$(inet_addr.port)";
  }
}
