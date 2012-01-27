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

public class Ab_Addr : GLib.Object {

  /** Constructor */
  public Ab_Addr () {
    key = new Ab_Key();
    inet_addr = new InetSocketAddress(new InetAddress.any(SocketFamily.IPV6), 0);
  }
  
  public Ab_Addr.inet (InetSocketAddress addr) {
    key = new Ab_Key();
    inet_addr = addr;
  }
  
  public Ab_Addr.full (InetSocketAddress addr, Ab_Key key) {
    this.key = key;
    this.inet_addr = addr;
  }

  public InetSocketAddress inet_addr { get; set; }
  public Ab_Key key { get; set; }

  public void dump(ref uint8[] buffer) {

  }

  public uint32 serialized_size() {
    return 0;
  }
  
  /** Comparaison between two Ab_Addr.
   *
   * @param other other Ab_Addr which is compared to.
   * @return true if two Ab_Addr are equals.
   */
  public bool equal(Ab_Addr other) {
    if(!key.equal(other.key))
      return false;
    if(!inet_addr.address.equal(other.inet_addr.address))
      return false;
    if(inet_addr.port != other.inet_addr.port)
      return false;
    return true;
  
  }

  public string to_string() {
    return @"$key:$(inet_addr.address):$(inet_addr.port)";
  }
}
