---
name: sc8f054-xc8-build
description: >-
  Builds SC8F054 firmware with SCMCU IDE V2.00.17 Beta3 bundled MPLAB XC8 V1.45
  via pass1+link, reading sources/opts from the project .scw. Use when the user
  asks to compile, build, 编译, or check Flash/RAM for QW-247 / SC8F054 / SCMCU
  / XC8 projects.
---

# SC8F054 XC8 Command-Line Build

## When to use

- User asks to 编译 / build / compile this SC8F054 receiver firmware
- Need Flash/RAM numbers after a code change
- IDE GUI is unavailable but `data/bin/xc8.exe` exists

## Toolchain defaults (this machine)

| Item | Value |
|------|-------|
| IDE root | `E:\data\software\SC8F054_DK\SC8F054_DK\IDE\SCMCU_IDE_V2.00.17_Beta3\SCMCU_IDE_V2.00.17_Beta3` |
| XC8 | `<IDE root>\data\bin\xc8.exe` (V1.45) |
| Override | env `SCMCU_IDE_ROOT` or `-IdeRoot` |
| Project file | `*.scw` (Device / OptValue / WarningValue / SourceFile) |

Do not upgrade XC8 or swap chip headers unless the user asks.

## Preferred action

Run the project script from the firmware repo root (or pass `-ProjectDir`):

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .cursor/skills/sc8f054-xc8-build/scripts/build.ps1
```

If the skill is only in the user Agent Store, copy/use:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/build.ps1 -ProjectDir "<firmware-root>"
```

Report from `output/build_log.txt`:

- Program space words and %
- Data space bytes and %
- exit code / whether HEX exists (`output/<scw-basename>.hex`)

## Manual steps (equivalent)

1. Prepend IDE `data\bin` to `PATH`.
2. Ensure `output/` exists.
3. Parse `.scw` for `Device`, `OptValue`, `WarningValue`, each `SourceFile=`.
4. **Pass1** each source:

```text
xc8 --chip=<Device> -Q --opt=<OptValue> --warn=<WarningValue> --outdir=output --objdir=output --pass1 <file.c> -Ooutput/<base>.p1
```

5. **Link** all `.p1`:

```text
xc8 --chip=<Device> -Q --opt=<OptValue> --warn=<WarningValue> --outdir=output --objdir=output --asmlist --summary=default,-psect,-class,+mem,-hex,-file --output=intel --runtime=default,+clear,+init,-keep,+osccal,-download,-resetbits,+config,+clib,+plib output\*.p1 -Ooutput/<scw-basename>.hex
```

Current QW-247 nomoto defaults from `SC8F054_timer_C.scw`:

- Device=`SC8F054`
- Opt=`-local,-asmfile,+asm,+speed,-space,-debug`
- Warn=`-9`
- Sources: `SC8F054_main.c` `SC8F054_key.c` `SC8F054_init.c` `SC8F054_led.c` `SC8F054_soft.c` `SC8F054_xl2400t.c` `SC8F054_usart.c`

## Important caveats

- **CONFIG words**: `.scw` has `config=FEFF,FAEF,FFFF,FFFF,`. CLI link above uses XC8 defaults and may warn `(1311) missing configuration setting`. Program size is still valid; **production burn should use SCMCU IDE build** for matching CfgCRC, or later extend the script to inject config.
- Keep sources **GBK + CRLF**; do not re-encode whole files when patching.
- Flash is nearly full (~98%+). After build, compare against `AGENTS.md` baseline; prefer shrinking before adding features.
- Do not commit `output/` artifacts unless the user asks.

## After build checklist

1. `0 Error` in log
2. Record Flash/RAM in the reply
3. Static scan: no `0x50` / `DW7802` motor code if this is a nomoto product
4. State clearly if only CLI build was done (config may differ from IDE)
