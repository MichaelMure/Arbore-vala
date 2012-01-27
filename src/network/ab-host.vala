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

/** This class is an abstraction of an host in the network. */
public class Ab_Host : GLib.Object {

  public Ab_Host() {

  }

  public Ab_Addr addr { get; set; }

  /** @return the textual representation of this, for debugging purpose */
  public string to_string() {
    return @"$addr";
  }

  /** Serialize into the provided buffer */
  public void dump(ref uint8[] buffer) {

  }

  /** @return the serialized size of this object, in octet */
  public uint32 serialized_size() {
    return 0;
  }

  /** Updates the success rate to the host based on the SUCCESS_WINDOW average.
    * @param success should be true if the connection with the host was successfull, false otherwise.
    */
  public void update_stat(bool success) {

  }

}
