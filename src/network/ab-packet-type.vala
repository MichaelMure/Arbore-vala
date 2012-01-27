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

/** This class is a description of a packet type and its content. It does not hold
 * any actual value. */
public class Ab_PacketType : GLib.Object {

  /** PacketType constructor.
   *
   * @param type  this is the type number.
   * @param handler  the handler object.
   * @param flags  flags for packets created with this packet type.
   * @param name  name of message, for debug information.
   * @param ...  put here a list of Ab_PacketArg.Type
   *
   * For example:
   * @code
   * Ab_PacketType(10, MyHandler, Packet::MUSTROUTE|Packet::REQUESTACK, "CHAT", STR, UINT32, CHUNK);
   * @endcode
   */
  public Ab_PacketType (uint32 type_number, Ab_PacketHandler handler, uint32 flags, string name, ...) {
    this.type_number = type_number;
    this.handler = handler;
    this.flags = flags;
    this.name = name;

    var l = va_list();
    Ab_PacketArg.Type ? arg_type = l.arg();
    while(arg_type != null) {
      this.arguments.add(arg_type);
      arg_type = l.arg();
    }
  }

  /** @return the textual representation of this, for debugging purpose */
  public string to_string() {
    return @"$name ($type_number)";
  }

  /** Identification number for this type */
  public uint32 type_number { get; private set; }
  /** Textual name */
  public string name { get; private set; }
  /** Handler to treat it */
  public Ab_PacketHandler handler { get; private set; }
  /** Default flag */
  public uint32 flags { get; private set; }
  /** Description of the content of the packet */
  public ArrayList<Ab_PacketArg.Type> arguments { get; private set; }
}
