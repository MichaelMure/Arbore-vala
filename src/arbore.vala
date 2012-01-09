/*
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

using GLib;
using Gtk;

public class Main : Object 
{

  /* 
   * Uncomment this line when you are done testing and building a tarball
   * or installing
   */
  //const string UI_FILE = Config.PACKAGE_DATA_DIR + "/" + "arbore.ui";
  const string UI_FILE = "arbore.ui";


  public Main ()
  {

    try 
    {
      var builder = new Builder ();
      builder.add_from_file (UI_FILE);
      builder.connect_signals (this);

      var window = builder.get_object ("window") as Window;
      window.show_all ();
    } 
    catch (Error e) {
      stderr.printf ("Could not load UI: %s\n", e.message);
    } 

  }

  [CCode (instance_pos = -1)]
  public void on_destroy (Widget window) 
  {
    Gtk.main_quit();
  }

  static int main (string[] args) 
  {
    Gtk.init (ref args);
    //var app = new Main ();
    new Main ();

    Gtk.main ();

    return 0;
  }
}
