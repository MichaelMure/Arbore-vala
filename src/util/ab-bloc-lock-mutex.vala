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

/** Lock a Mutex locally.
 *
 * On a block, juste create an auto instance of this class.
 * When it will be removed (while exiting this block), mutex will be unlocked.
 *
 * Juste use:
 * Ab_BlocLockMutex lock(mutex);
 *
 */
public class Ab_BlocLockMutex : GLib.Object {

  public Ab_BlocLockMutex (Mutex mutex) {
	mutex_ = mutex;
	mutex_.lock();
  }

  ~Ab_BlocLockMutex () {
	mutex_.unlock();
  }

  private unowned Mutex mutex_;
}
