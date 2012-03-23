/*
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



public class Ab_ArrayPrinter : GLib.Object {

  /** Print an array as a valid Vala code, usefull for writing test. */
  public static void printArray(ref uint8[] buffer) {
    stdout.printf("  private uint8[] array = {");

    uint8 x = 0;
    foreach(uint8 data in buffer) {
      if(x > 0) {
        stdout.printf(", ");
        if(x % 10 == 0)
          stdout.printf("\n                           ");
      }

      stdout.printf("%X", data);
      x++;
    }

    stdout.printf("};");
  }
}
