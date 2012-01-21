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

using Posix;

namespace Ab_Log {

  public enum LogLevel {
    DEBUG   = 1 << 0, /* Debug */
    PARSE   = 1 << 1, /* Show parsing */
    ROUTING = 1 << 2, /* Routing information */
    WARNING = 1 << 3, /* Warnings */
    ERROR   = 1 << 4, /* Errors */
    INFO    = 1 << 5; /* Informations */

    public string to_string() {
      return ((GLib.EnumClass) (typeof (LogLevel).class_ref())).get_value (this).value_nick;
    }

    public int syslog_level() {
      switch (this) {
        case DEBUG:
        case PARSE:
        case ROUTING:
          return Posix.LOG_DEBUG;
        case WARNING:
          return Posix.LOG_WARNING;
        case ERROR:
          return Posix.LOG_ERR;
        case INFO:
          return Posix.LOG_NOTICE;
        default:
          assert_not_reached();
      }
    }
  }

  /* Activate or not logging into system log */
  public void set_syslog(bool print_to_syslog) {
    to_syslog = print_to_syslog;
  }

  /* Set logged levels in one call
   * @param levels a set of ORed levels (default is (LogLevel.WARNING | LogLevel.ERROR | LogLevel.INFO))
   */
  public void set_logged_levels (int levels) {
    logged_levels = levels;
  }

  /** Enable a level */
  public void log_level (LogLevel level) {
    logged_levels |= level;
  }

  /** Disable a level */
  public void unlog_level (LogLevel level) {
    logged_levels &= int.MAX - level;
  }

  /** Output a debug level message */
  public void debug(string message) {
    print(message, LogLevel.DEBUG);
  }

  /** Output a parse level message */
  public void parse(string message) {
    print(message, LogLevel.PARSE);
  }

  /** Output a routing level message */
  public void routing(string message) {
    print(message, LogLevel.ROUTING);
  }

  /** Output a warning level message */
  public void warning(string message) {
    print(message, LogLevel.WARNING);
  }

  /** Output an error level message */
  public void error(string message) {
    print(message, LogLevel.ERROR);
  }

  /** Output an info level message */
  public void info(string message) {
    print(message, LogLevel.INFO);
  }

  /** Internal function to print a message */
  private void print(string message, LogLevel level) {
    if((level & logged_levels) != 0) {
      if(to_syslog) {
        Posix.syslog(level.syslog_level(), message);
      }

      GLib.print("%s [%s] %s\n",
                 Time().local(time_t()).to_string(),
                 level.to_string(),
                 message);
    }
  }

  private int logged_levels = (LogLevel.WARNING | LogLevel.ERROR | LogLevel.INFO);
  private bool to_syslog = false;
}
