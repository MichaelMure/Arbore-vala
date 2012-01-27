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

public errordomain Ab_PacketError {
  MALFORMED
}

/** \brief the Packet's representation class.
 *
 * This class can be used to represent a packet which
 * can be sent or received to/from an other peer.
 *
 * The physical structure of a packet is:
 *
 * .----------.----------.----------.
 * |    src   |    dst   |   type   |
 * |  uint160 |  uint160 |  uint32  |
 * |----------+----------+----------|
 * |   size   |  seqnum  |  flags   |
 * |  uint32  |  uint32  |  uint32  |
 * |----------'----------'----------|
 * |                                |
 * |             data ...           |
 * |                                |
 * '--------------------------------'
 *
 * All arguments are not separated. To read a
 * packet content you have to know what
 * are arguments of this packet type.
 *
 * This is why you have to give a PacketType object,
 * or a pointer to a PacketTypeList object in
 * the constructor which gets data buffer.
 */
public class Ab_Packet : GLib.Object {

  public enum Flag {
    REQUESTACK  = 1 << 0,  /** This packet request an acknoledge answer. */
    ACK         = 1 << 1,  /** This is an acknowledge answer. */
    MUSTROUTE   = 1 << 2   /** This packet must be routed. */
  }

  /** Constructor to build a new packet.
   *
   * @param type  this is the PacketType object which described the type of packet.
   * @param source  sender's key of the packet.
   * @param destination  receiver's key of the packet.
   */
  public Ab_Packet (Ab_PacketType packet_type,
                    Ab_Key source = new Ab_Key(),
                    Ab_Key destination = new Ab_Key())
  {
    this.packet_type = packet_type;
    this.src = source;
    this.dst = destination;
    this.flags = packet_type.flags;
  }


  /** Constructor to build the Packet object from data.
   *
   * It gets the packet's header, find the type and wait for
   * the \b SetContent method call to fill args.
   *
   * @param pckt_type_list  This is the PacketTypeList object pointer which
   *                        is used to get the PacketType object from type
   *                        contained in header.
   * @param data  the header data (size must be GetHeaderSize()).
   */
  public Ab_Packet.with_data (Ab_PacketTypeList pckt_type_list,
                              uint8[] data)
  {

  }

  /** Packet type */
  public Ab_PacketType packet_type { get; private set; }
  /** Size of the message (excluding header) */
  public uint32 data_size { get; private set; default=0; }
  /** Sender's key */
  public Ab_Key src { get; set; }
  /** Destination's key */
  public Ab_Key dst { get; set; }
  /** Flags */
  public uint32 flags { get; set; }
  /** Sequence number */
  public uint32 seqnum { get; set; default=0; }

  /** @return true if the packet has this flag set. */
  public bool has_flag(Flag flag) {
    return (flags & flag) != 0;
  }

  /** Set a flag */
  public void set_flag(Flag flag) {
    flags |= flag;
  }

  /* Clear a flag */
  public void clr_flag(Flag flag) {
    flags &= ~flag;
  }

  public void dump(ref uint8[] buffer) {

  }

  /** @return the size of the header serialized, in octet */
  public ulong get_header_size() {
    return Ab_Key.serialized_size()  /* source */
         + Ab_Key.serialized_size()  /* destination */
         + sizeof(uint32)            /* type */
         + sizeof(uint32)            /* data size */
         + sizeof(uint32)            /* sequence number */
         + sizeof(uint32);           /* flags */
  }

  /** @return the size of the full serialized packet, in octet */
  public ulong serialized_size() {
    return data_size + get_header_size();
  }

  public string to_string () {
    var str = @"[$src->$dst] <";
    if(has_flag (Flag.REQUESTACK))
      str += "(RACK)";
    if(has_flag (Flag.ACK))
      str += "(ACK)";
    if(has_flag (Flag.MUSTROUTE))
      str += "(ROUTE)";
    str += ">";

    string arg_str = "";
    foreach (var arg in args) {
      if(arg_str.length > 0)
        arg_str += ", ";
      arg_str += @"$arg";
    }

    return str + arg_str;
  }

  private ArrayList<Ab_PacketArg> args;
}
