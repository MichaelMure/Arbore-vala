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

/* Note: the original implementation had exception handling code */

public errordomain Ab_ThreadError {
  CANT_CREATE
}

public abstract class Ab_Thread : GLib.Object {

  /** Constructor */
  public Ab_Thread () {
  }

  /** Destructor */
  ~Ab_Thread () {
    stop();
  }

  /** Start the thead */
  public void start() throws Ab_ThreadError {
    if(is_running)
      return;

    is_running = true;
    on_start ();

    try {
      this.thread_id = Thread.create<void*> (this.do_loop, true);
    }
    catch (GLib.ThreadError e)
    {
      is_running = false;
      throw new Ab_ThreadError.CANT_CREATE(e.message);
    }

    if(this.thread_id == null) {
      is_running = false;
      throw new Ab_ThreadError.CANT_CREATE(_("Thread id is null."));
    }
  }

  /** Stop the thread */
  public void stop() {
    if(!is_running)
      return;
    is_running = false;
    thread_id.join ();
    on_stop();
  }

  /** true if the thread is running. */
  public bool is_running { get; private set; default = false; }

  /** Actual working loop */
  protected abstract void loop();

  /** Called before the main loop starts */
  protected virtual void on_start() {}

  /** Called after the main loop finished */
  protected virtual void on_stop() {}


  private unowned Thread<void*> thread_id = null; /** handle to the actual thread */

  /** Internal function lanched by the thread. */
  private void* do_loop () {
    while (is_running)
      loop ();

    thread_id.exit (null);
    return null;
  }
}
