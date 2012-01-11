/*
 * Copyright(C) 2008 Laurent Defert, Romain Bignon
 * Copyright(C) 2011-2012 Michael Muré <batolettre@gmail.com>
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

public errordomain Ab_PacketTypeListError {
  UNKNOW_TYPE
}

/** This class hold a list of Ab_PacketType, and thus allow to retrieve
 * the good handler for a given packet's type number.
 */
public class Ab_PacketTypeList : GLib.Object {

  /** Register a new PacketType */
  public void register_type (Ab_PacketType type) {
    lock(PacketTypeMap) {
      assert(!PacketTypeMap.has_key(type.type_number));
      Ab_Log.debug(@"Register $type");
      PacketTypeMap.set(type.type_number, type);
    }
  }

  /** Retrieve the PacketType corresponding to the type number */
  public Ab_PacketType get_packet_type(uint32 type_number) throws Ab_PacketTypeListError {
    lock(PacketTypeMap) {
      var type = PacketTypeMap.get(type_number);
      if(type == null)
        throw new Ab_PacketTypeListError.UNKNOW_TYPE("Unknow type number");
      return type;
    }
  }

  private HashMap<uint32, Ab_PacketType> PacketTypeMap;
}
