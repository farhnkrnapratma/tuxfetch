<!--
-- SPDX-License-Identifier: MIT
--
-- tuxfetch
--
-- Copyright (C) 2025 Farhan Kurnia Pratama
--
-- GitHub     : https://github.com/farhnkrnapratma/tuxfetch
-- Maintainer : Farhan Kurnia Pratama <farhnkrnapratma@gmail.com>
-->
# 🐧 Tuxfetch

A minimalist fetch for Linux created using Bash v5+.

## Managing Tuxfetch

### Clone the Repository

```bash
git clone https://github.com/farhnkrnapratma/tuxfetch.git
```

### Navigate to the Directory

```bash
cd path/to/tuxfetch
```

### Installation

```Bash
make install                # install Tuxfetch and generate the default configuration file
```

### Updating

```Bash
make update                 # update Tuxfetch to the latest version (preserves existing configurations)
                            # or
make clean-update           # update Tuxfetch and regenerate the configuration file (resets to default settings)
```

### Uninstallation

```Bash
make uninstall              # remove Tuxfetch (preserves configuration files)
                            # or
make clean-uninstall        # remove Tuxfetch and delete all associated configuration files
```

### Post Installation

```Bash
tuxfetch --update           # equivalent to make update command
tuxfetch --clean-update     # equivalent to make clean-update command
tuxfetch --uninstall        # equivalent to make uninstall command
tuxfetch --clean-uninstall  # equivalent to make clean-uninstall command
```

## Configuring Tuxfetch

You can edit the configuration at `$HOME/.config/tuxfetch/init`.

### About `tuxify` Function

The `tuxify` function serves as the primary entry point for processing and displaying output generated within it, such as output from the `yield` function. Since `tuxify` is a Bash function, you can freely customize its output behavior according to your needs. Ensure that any modifications you make adhere to valid Bash syntax rules.

### About `yield` Function

The `yield` function controls how information is displayed in Tuxfetch and it accepts one or two arguments.

**Usage:**

```Bash
tuxify()
{
  yield [string|option]             # one argument
                                    # or
  yield [string] [string|option]    # two arguments
}
```
**Valid Examples:**

```Bash
tuxify()
{
  yield "Hello, World!"
  yield newline
  yield tclock
  yield "Clock   " tclock
  yield "Name    " "Joe"
}
```
**Important Notes:**
- If both arguments are options (e.g., `yield thost tuser`), the first is treated as plain text, which may not behave as expected.
- Use options like `tclock`, `tuser`, etc., only as the second argument in the two-argument form to resolve their values dynamically.
- The `yield` function must be called inside the `tuxify` function.

### Options

Below is a table listing the built-in options used in the `yield` function along with their descriptions.

| Option          | Description                                                                                         |
|-----------------|-----------------------------------------------------------------------------------------------------|
| `newline`       | Inserts a new line into the output                                                                  |
| `tuser`         | Retrieves the current user's name                                                                   |
| `thost`         | Retrieves the system's hostname                                                                     |
| `tdistro`       | Retrieves the Linux distribution name                                                               |
| `tkernel`       | Retrieves the kernel version and related details                                                    |
| `tclock`        | Retrieves the current time based on the configured clock format                                     |
| `tdate`         | Retrieves the current date according to the chosen date format                                      |
| `tpower`        | Retrieves the battery or power status information                                                   |
| `tuptime`       | Retrieves the system uptime                                                                         |

### Option Keys

Below is a table listing all of keys and its options to configure built-in options.

| Key           | Description                              | Options                                                                                                                                                      | Default Value     |
|---------------|------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|
| `host`        | Hostname display format                  | `"full"`, `"short"`                                                                                                                                          | `"short"`         |
| `distro`      | Linux distro name format                 | `"short"`, `"full"`                                                                                                                                          | `"full"`          |
| `kernel`      | Kernel information format                | `"no_arch"`, `"no_version"`, `"short"`, `"full"`                                                                                                             | `"full"`          |
| `clock`       | Time display format                      | `"h24_full"`, `"h12_full"`, `"h24_no_second"`, `"h12_no_second"`, `"h24_no_tz"`, `"h12_no_tz"`, `"h24_short"`, `"h12_short"`, `"<custom>"`                   | `"h24_full"`      |
| `date`        | Date display format                      | `"long"`, `"short"`, `"long_short"`, `"long_no_day"`, `"long_nd_short"`, `"short_year"`, `"<custom>"`                                                        | `"long"`          |
| `power`       | Power/battery status display             | `"full"`, `"hide_type"`, `"hide_plugged"`, `"hide_unplugged"`, `"no_status"`                                                                                 | `"full"`          |
| `uptime`      | System uptime format                     | `"full"`, `"no_second"`, `"tiny"`, `"tiny_no_second"`                                                                                                        | `"tiny_no_second"` |
| `separator`   | Separator between label and content      | `"hide"`, `"<separator>"`                                                                                                                                    | `":"`             |

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
| `globalcl`    | Global color for all output              | `"no"`, `0–13`      | `"no"`        |
| `textcl`      | Color for plain text                     | `0–13`              | `"5"`         |
| `separatorcl` | Color for the separator                  | `0–13`              | `"13"`        |
| `usercl`      | Color for the username                   | `0–13`              | `"3"`         |
| `hostcl`      | Color for the hostname                   | `0–13`              | `"4"`         |
| `distrocl`    | Color for the distro name                | `0–13`              | `"0"`         |
| `kernelcl`    | Color for the kernel                     | `0–13`              | `"1"`         |
| `clockcl`     | Color for the time                       | `0–13`              | `"1"`         |
| `datecl`      | Color for the date                       | `0–13`              | `"2"`         |
| `batterycl`   | Color for the battery/power status       | `0–13`              | `"5"`         |
| `uptimecl`    | Color for the uptime                     | `0–13`              | `"10"`        |

## Changelog

For a detailed list of updates, fixes, and new features, refer to the [`CHANGELOG.md`](./CHANGELOG.md) file.

## Contributing

You can contribute to the project by submitting GitHub issues/pull requests or donating to support the maintainer!

---

&copy; 2025 Farhan Kurnia Pratama
