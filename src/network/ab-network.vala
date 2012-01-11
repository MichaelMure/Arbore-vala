/*
 * Copyright(C) 2008 Laurent Defert, Romain Bignon
 * Copyright(C) 2011 Michael Muré <batolettre@gmail.com>
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

public errordomain Ab_NetworkError {
  CANT_OPEN_SOCK,
  CANT_LISTEN,
  CANT_CONNECT_TO
}

public class Ab_Network : GLib.Object {

  public Ab_Network () {

  }

  ~Ab_Network () {
    close_all();
  }

  /**
   * Listen an UDP port.
   * @param port  the listened port
   * @param packet_type_list  this is the object which describes the packet types and
   *                          them handlers.
   * @return the opened socket, to use for future call to send() 
   */
  public Socket listen (uint16 port, Ab_PacketTypeList packet_type_list) throws Ab_NetworkError {
    Socket socket = null;

    /* create an IPv6 udp socket */
    try {
      socket = new Socket (SocketFamily.IPV6,
                           SocketType.DATAGRAM,
                           SocketProtocol.UDP);
    }
    catch(Error e) {
      throw new Ab_NetworkError.CANT_OPEN_SOCK(e.message);
    }

    /* binding in localhost */
    var ia = new InetAddress.loopback (SocketFamily.IPV6);
    var isa = new InetSocketAddress (ia, port);

    try {
      socket.bind(isa, true);
    }
    catch(Error e) {
      throw new Ab_NetworkError.CANT_LISTEN(e.message);
    }

    /* add a receive callback */
    var source = socket.create_source(IOCondition.IN, null);
    source.set_callback (receive_callback);
    source.attach (null);

    lock(lock_) {
      sockmap[socket] = packet_type_list;
    }
    return socket;
  }

  /** 
   * Send a packet to a host, using the socket.
   * @param socket a valid socket, obtained with listen()
   * @param host the destination host
   * @param packet the packet to send
   */
  public bool send(Socket socket, Ab_Host host, Ab_Packet packet) {
    lock(lock_) {

    }
    return false;
  }

  /**
   * Close all the registered sockets.
   */
  public void close_all() {
    lock(lock_) {
      foreach(var socket in sockmap.keys) {
        try {
          socket.shutdown(true, true);
          socket.close();
        }
        catch(Error e) {
          Ab_Log.error("Error in closing socket: $(e.message)");
        }
      }
      sockmap.clear();
    }
  }

  private bool receive_callback (Socket socket, IOCondition condition) {
    return false;
  }

  private int lock_;
  private HashMap<Socket, Ab_PacketTypeList> sockmap;

}
