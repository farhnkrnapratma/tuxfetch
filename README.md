# 🐧 Tuxfetch

A minimalist fetch for Linux created using Bash v5+.

## Managing Tuxfetch

### Installing

There are two `make` command options for installing Tuxfetch:

1. `install` install Tuxfetch and generate the configuration file.
2. `clean-install` install Tuxfetch, remove the previous configuration file (if any), and generate the new one.

### Updating

#### With `make` command

There are two `make` command options for updating Tuxfetch:

1. `update` update Tuxfetch to the newer version but keep the configuration file.
2. `clean-update` update Tuxfetch to the newer version, remove the previous configuration file, and generate the new one.

#### With `tuxfetch` command

If Tuxfetch is already installed, there are two `tuxfetch` command options for updating Tuxfetch:

1. `--update | -up` equivalent to `make update` command.
2. `--clean-update | -cup` equivalent to `make clean-update` command.

### Uninstalling 

#### With `make` command

There are two `make` command options for uninstalling Tuxfetch:

1. `uninstall` uninstall Tuxfetch but keep the configuration file.
2. `clean-uninstall` uninstall Tuxfetch and remove the configuration file.

#### With `tuxfetch` command

If Tuxfetch is already installed, there are two `tuxfetch` command options for uninstalling Tuxfetch:

1. `--uninstall | -un` equivalent to `make uninstall` command.
2. `--clean-uninstall | -cun` equivalent to `make clean-uninstall` command.

### Why is there a `clean-*` option?

Overall, while all commands perform basic operations such as installing or removing Tuxfetch script, the `clean-*` prefixed options provide additional steps to manage configuration files. This is useful for adapting the action to the situation at hand: whether you want to keep the existing configuration or start with a clean slate.

## Configuring Tuxfetch

After installing Tuxfetch, you can customize its behavior by editing the configuration file at `$HOME/.config/tuxfetch/`.

### About `yield`

Here is a brief explanation of the valid arguments in the `yield` function.

**Example:**

```Bash
# $HOME/.config/tuxfetch/init

tuxify() {
  yield "🐧 Tuxfetch"
  yield newline
  yield "  User     " tuser
  yield "󰒍  Host     " thost
  yield "  Distro   " tdistro
  yield "  Kernel   " tkernel
  yield "󰥔  Clock    " tclock
  yield "  Date     " tdate
  yield "󱐋  Power    " tpower
  yield "󱨺  Uptime   " tuptime
  yield newline
}
```

**Usage:**

```Bash
tuxify() {
  yield [string|option]
}

# example

tuxify() {
  yield "Hello, World!"             # ✅
  yield newline                     # ✅
  yield                             # 🙅🏻‍♂️
}

# or

tuxify() {
  yield [string] [string|option]
}

# example

tuxify() {
  yield "Clock     " tclock         # ✅
  yield "Name      " "Your Name"    # ✅
  yield tclock "Clock"              # 🙅🏻‍♂️
  yield thost tuser                 # 🙅🏻‍♂️
}
```

### Options

Below is a table listing the built-in options used in the `tuxify()` function along with their descriptions.

| Option          | Description                                                                                         |
|-----------------|-----------------------------------------------------------------------------------------------------|
| `newline`       | Inserts a new line into the output.                                                                 |
| `tuser`         | Retrieves the current user's name.                                                                  |
| `thost`         | Retrieves the system's hostname.                                                                    |
| `tdistro`       | Retrieves the Linux distribution name.                                                              |
| `tkernel`       | Retrieves the kernel version and related details.                                                   |
| `tclock`        | Retrieves the current time based on the configured clock format.                                    |
| `tdate`         | Retrieves the current date according to the chosen date format.                                     |
| `tpower`        | Retrieves the battery or power status information.                                                  |
| `tuptime`       | Retrieves the system uptime in a concise or detailed manner based on the configuration.             |

### Option Keys

Below is a table listing all of keys and its options to configure built-in functions of Tuxfetch.

| Key           | Description                              | Options                                                                                                                                                      | Default Value     |
|---------------|------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|
| `host`        | Hostname display format.                 | `"full"`, `"short"`                                                                                                                                          | `"short"`         |
| `distro`      | Linux distribution name format.          | `"short"`, `"full"`                                                                                                                                          | `"full"`          |
| `kernel`      | Kernel information format.               | `"no_arch"`, `"no_version"`, `"short"`, `"full"`                                                                                                             | `"full"`          |
| `clock`       | Time display format.                     | `"h24_full"`, `"h12_full"`, `"h24_no_second"`, `"h12_no_second"`, `"h24_no_tz"`, `"h12_no_tz"`, `"h24_short"`, `"h12_short"`, `"<custom>"`                   | `"h24_full"`      |
| `date`        | Date display format.                     | `"long"`, `"short"`, `"long_short"`, `"long_no_day"`, `"long_nd_short"`, `"short_year"`, `"<custom>"`                                                        | `"long"`          |
| `power`       | Power/battery status display.            | `"full"`, `"hide_type"`, `"hide_plugged"`, `"hide_unplugged"`, `"no_status"`                                                                                 | `"full"`          |
| `uptime`      | System uptime format.                    | `"full"`, `"no_second"`, `"tiny"`, `"tiny_no_second"`                                                                                                        | `"tiny_no_second"` |
| `separator`   | Separator between elements.              | `"hide"`, `"<separator>"`                                                                                                                                    | `":"`             |

### Date and Time Custom Format

The current date and time are displayed using the output of the system's date command. This means that by default, the format is determined by what date outputs. If you want to customize how the date and time appear, you can do so by combining various configuration keys. These keys allow you to pick and choose which parts of the date and time (like hours, minutes, seconds, day, month, year and timezone) are displayed and in what order. By mixing these keys, you can create a custom format that perfectly fits your needs.

Below are two tables listing the available `date` command options. You can use these specifiers individually or combine them to create custom date and time formats for your display.

#### Table 1: Date and Week Specifiers

| Format Specifier | Description                                                      |
|------------------|------------------------------------------------------------------|
| `%a`             | Abbreviated weekday name (e.g., Sun)                             |
| `%A`             | Full weekday name (e.g., Sunday)                                 |
| `%w`             | Weekday number (0-6, Sunday = 0)                                 |
| `%d`             | Day of month (01-31)                                             |
| `%e`             | Day of month, space-padded ( 1-31)                               |
| `%u`             | ISO weekday number (1-7, Monday = 1)                             |
| `%U`             | Week number of the year (weeks start on Sunday, 00-53)           |
| `%V`             | ISO week number (01-53)                                          |
| `%W`             | Week number of the year (weeks start on Monday, 00-53)           |
| `%b`             | Abbreviated month name (e.g., Jan)                               |
| `%B`             | Full month name (e.g., January)                                  |
| `%h`             | Same as `%b` (abbreviated month name)                            |
| `%m`             | Month number (01-12)                                             |
| `%y`             | Last two digits of year (00-99)                                  |
| `%Y`             | Full year (e.g., 2023)                                           |

---

#### Table 2: Time, Time Zone and Additional Specifiers

| Format Specifier | Description                                                      |
|------------------|------------------------------------------------------------------|
| `%H`             | Hour in 24-hour format (00-23)                                   |
| `%k`             | Hour in 24-hour format, space-padded ( 0-23)                     |
| `%I`             | Hour in 12-hour format (01-12)                                   |
| `%l`             | Hour in 12-hour format, space-padded ( 1-12)                     |
| `%M`             | Minute (00-59)                                                   |
| `%p`             | Uppercase AM/PM designation                                      |
| `%P`             | Lowercase am/pm designation                                      |
| `%S`             | Second (00-60)                                                   |
| `%T`             | 24-hour time (equivalent to `%H:%M:%S`)                          |
| `%r`             | 12-hour time (e.g., 11:11:04 PM)                                 |
| `%R`             | 24-hour time without seconds (equivalent to `%H:%M`)             |
| `%X`             | Locale’s time representation                                     |
| `%D`             | Date in MM/DD/YY format                                          |
| `%F`             | Date in YYYY-MM-DD format                                        |
| `%s`             | Seconds since 1970-01-01 00:00:00 UTC                            |
| `%N`             | Nanoseconds (000000000–999999999)                                |
| `%z`             | Numeric time zone offset (e.g., -0700)                           |
| `%:z`            | Time zone offset with a colon (e.g., -07:00)                     |
| `%::z`           | Time zone offset with seconds (e.g., -07:00:00)                  |
| `%:::z`          | Time zone offset with fractional seconds, if available           |
| `%Z`             | Time zone abbreviation (e.g., PDT)                               |
| `%c`             | Locale’s date and time (e.g., Thu Mar  3 23:05:25 2005)          |
| `%x`             | Locale’s date representation                                     |
| `%+`             | Date and time in locale-specific format                          |

#### Examples

```Bash
clock="%H:%M:%S"       # Expected output: 14:30:15
```

```Bash
date="%m/%d/%Y"        # Expected output: 02/19/2025
```

### Colors

Below is a table listing all supported colors.

| **Code** | Color          |
|----------|----------------|
| **0**    | Red            |
| **1**    | Green          |
| **2**    | Yellow         |
| **3**    | Blue           |
| **4**    | Magenta        |
| **5**    | Cyan           |
| **6**    | White          |
| **7**    | Bright Red     |
| **8**    | Bright Green   |
| **9**    | Bright Yellow  |
| **10**   | Bright Blue    |
| **11**   | Bright Magenta |
| **12**   | Bright Cyan    |
| **13**   | Bright White   |

---

### Coloring Options

Below is a table listing the coloring options.

| Key           | Description                              | Options             | Default Value |
|---------------|------------------------------------------|---------------------|---------------|
| `globalcl`    | Global color for all output.             | `"no"`, `0–13`      | `"no"`        |
| `textcl`      | Color for text.                          | `0–13`              | `"5"`         |
| `separatorcl` | Color for the separator between elements.| `0–13`              | `"13"`        |
| `usercl`      | Color for the username display.          | `0–13`              | `"3"`         |
| `hostcl`      | Color for the hostname display.          | `0–13`              | `"4"`         |
| `distrocl`    | Color for the distribution name.         | `0–13`              | `"0"`         |
| `kernelcl`    | Color for the kernel version.            | `0–13`              | `"1"`         |
| `clockcl`     | Color for the time display.              | `0–13`              | `"1"`         |
| `datecl`      | Color for the date display.              | `0–13`              | `"2"`         |
| `batterycl`   | Color for the battery/power status.      | `0–13`              | `"5"`         |
| `uptimecl`    | Color for the uptime display.            | `0–13`              | `"10"`        |

## Changelog

Read [`CHANGELOG.md`](./CHANGELOG.md) for information about changes or updates contained in the latest version.

## Contributing

You can contribute to this project by submitting an issue or pull request in the Tuxfetch GitHub repository. You can also contribute by donating to the maintainer.

## Maintainer

Farhan Kurnia Pratama [`farhnkrnapratma@protonmail.com`](farhnkrnapratma@protonmail.com)

---

&copy; 2025 Farhan Kurnia Pratama
