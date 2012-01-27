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

public class Ab_Time {

  /** @return the time of day in double format with microsecond precision.
   * Unit is the second.
   */
  public static double dtime() {
    TimeVal tv = TimeVal();
    tv.get_current_time();
    return tvtod(tv);
  }

  /** @return the double representation of TimeVal tv */
  public static double tvtod (TimeVal tv) {
    return ((double)tv.tv_sec + ((double) tv.tv_usec / 1000000.0));
  }

}
