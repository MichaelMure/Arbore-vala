/* -*- Mode: vala; tab-width: 4; intend-tabs-mode: t -*- */
/* arbore-v
 *
 * Copyright (C) Michael Muré 2011 <batolettre@gmail.com>
 *
arbore-v is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * arbore-v is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/* Note: the original implementation had exception handling code */

public errordomain Ab_ThreadError {
	CANT_CREATE
}

public abstract class Ab_Thread : GLib.Object {
	
    public Ab_Thread () {
    }

	~Ab_Thread () {
		stop();
	}

	public void start() throws Ab_ThreadError {
		if(is_running ())
			return;

		running = true;
		on_start ();
		
		try {
			this.thread_id = Thread.create<void*> (this.do_loop, true);
		}
		catch (GLib.ThreadError e)
		{
			running = false;
			throw new Ab_ThreadError.CANT_CREATE(e.message);
		}

		if(this.thread_id == null) {
			running = false;
			throw new Ab_ThreadError.CANT_CREATE("Thread id is null.");
		}
	}
	
	public void stop() {
		if(!is_running ())
			return;
		running = false;
		thread_id.join ();
		on_stop();
	}
	
	bool is_running() {
		return running;
	}

	/* Actual working loop */
	protected abstract void loop();

	/* Called before the main loop starts */
	protected virtual void on_start() {}

	/* Called after the main loop finished */
	protected virtual void on_stop() {}

	
	private unowned Thread<void*> thread_id = null;
	private bool running = false;

	private void* do_loop () {
		while (is_running ())
			loop ();

		thread_id.exit (null);
		return null;
	}
}
