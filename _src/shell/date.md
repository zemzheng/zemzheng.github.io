# date

## 输出指定的格式

### Example

    date +'%s'

### 可用列表

格式 | 说明
--   | --
%%   | a literal %
%a   | locale's abbreviated weekday name (Sun..Sat)
%A   | locale's full weekday name, variable length (Sunday..Saturday)
%b   | locale's abbreviated month name (Jan..Dec)
%B   | locale's full month name, variable length (January..December)
%c   | locale's date and time (Sat Nov 04 12:02:33 EST 1989)
%d   | day of month (01..31)
%D   | date (mm/dd/yy)
%e   | day of month, blank padded ( 1..31)
%h   | same as %b
%H   | hour (00..23)
%I   | hour (01..12)
%j   | day of year (001..366)
%k   | hour ( 0..23)
%l   | hour ( 1..12)
%m   | month (01..12)
%M   | minute (00..59)
%n   | a newline
%p   | locale's AM or PM
%r   | time, 12-hour (hh:mm:ss [AP]M)
%s   | seconds since 00:00:00, Jan 1, 1970 (a GNU extension)
%S   | second (00..60)
%t   | a horizontal tab
%T   | time, 24-hour (hh:mm:ss)
%U   | week number of year with Sunday as first day of week (00..53)
%V   | week number of year with Monday as first day of week (01..52)
%w   | day of week (0..6);  0 represents Sunday
%W   | week number of year with Monday as first day of week (00..53)
%x   | locale's date representation (mm/dd/yy)
%X   | locale's time representation (%H:%M:%S)
%y   | last two digits of year (00..99)
%Y   | year (1970...)
%z   | RFC-822 style numeric timezone (-0500) (a nonstandard extension)
%Z   | time zone (e.g., EDT), or nothing if no time zone is determinable

