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

/** This class allow to hold different argument type as a common object, to be
 * stored in the Packet class */
public class Ab_PacketArg<T> : GLib.Object {

  public enum Type
  {
    UINT32,
    UINT64,
    KEY,
    STR,
    ADDR,
    ADDRLIST,
    CHUNK
  }
  
  public Ab_PacketArg(T arg_value) {
    this.arg_value = arg_value;
  }

  public T arg_value { get; set; }
}
