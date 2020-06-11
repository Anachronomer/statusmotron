# Statusmotron

Welcome!  This project intends to help by unobtrusively signal your status to those you share space with.  A visible signal helps prevent interruptions before they happen, and reduce the social friction of letting people know you are heads down.

## Project Fundamentals

Statusmotron uses the Nerves embedded Elixir framework and is composed of a firmware project, light control application and a web app.  The statuslight_fw folder contains the Nerves firmware project which depends on both the statuslight_control and statusmotron_ui projects.  The statuslight_control project is a basic Elixir OTP application that depends on the [Blinkchain library](https://github.com/GregMefford/blinkchain) to control addressable RGB LEDs.  The statusmotron_ui project is a [Phoenix](https://www.phoenixframework.org/) application that serves an API to set status and displays the current status to a browser.  The Status setting API also uses statuslight_control to set the color of the LEDs.

This readme acts as a primary point of documentation and intends to help anyone interested get up and running with a physical status light of their own.  This project also serves as a learning and exploration platform for me.

## Getting Started

In order to set up your own physical status light, you'll need some hardware and a configured build of this software to run on it.

### Gather and Build Hardware

Before I get started - the hardware part of this project involves electronic components.  *Please exercise your own judgement when working with these.  I accept no liability or responsibility for use of this information.*

One of my goals with this project is to have it be flexible to a variety of hardware platforms and cofigurations rather than specifying a single set of hardware.  It is my hope that you are able to use parts that are accessible in your area or that you already have on hand.  With that in mind, the fundamental components are a [Nerves compatible](https://hexdocs.pm/nerves/targets.html) platform, a power source, and one or more addressable RGB LEDs (aka Neopixels).
For my example device, and the default configuration in this project, I am using:
 * Raspberry Pi 0 W
 * 2A 5V mini usb power adapter
 * 12 LED Neopixel ring
 * An enclosure built of LEGO bricks
 * A level shifter built from a transister and a few resistors (more on this below)

#### A Note on Voltage Levels

The Raspberry Pi's GPIO pins operate at 3V3.  Most addressible RBG LEDs operate on 5V logic.  Depending on a number of variables, using the Pi's GPIO to operate the LEDs _might_ work, but to ensure reliable operation there are a couple of options to make the voltage levels compatible.
  * Drive the LEDs through a logic level shifter (TODO: details)
  * Power the LEDs at lower than 5V, such as through a single diode drop (TODO: details) though note that this will reduce potential brightness and may have other adverse affects on the LEDs
  * Use a single LED running at a lower voltage as a buffer for the rest (TODO: details)
  
#### Hardware Diagrams and Build Details

TODO

### Configure and Build Software

Note, this assumes you are using a Raspberry Pi 0 W.  Change the MIX_TARGET below if you are using another platform.

  * Edit [WiFi config](https://github.com/Anachronomer/statusmotron/blob/master/statuslight_fw/config/target.exs) to match your own network, replacing 'placeholder' values for WPA or modifying the config in other ways to suit your needs
  * Generate a secret key base using `mix phx.gen.secret` and place it [here](https://github.com/Anachronomer/statusmotron/blob/master/statusmotron_ui/config/prod.secret.exs)
  * This project assumes a device with 12 WS2812 or compatible addressible RGB LEDs (also known as Neopixels).  If you are using a device with a different number of LEDs, or if the colors are not being output as expected (RGB values being swapped), edit the configuration [here](https://github.com/Anachronomer/statusmotron/blob/master/statuslight_control/config/prod.exs)
  * Install dependencies with `MIX_TARGET=rpi0 MIX_ENV=prod mix deps.get`
  * Create the firmware image with `MIX_TARGET=rpi0 MIX_ENV=prod mix firmware`
  * For the first time setting up a new device, burn the firmware to an SD card with `MIX_TARGET=rpi0 MIX_ENV=prod mix firmware.burn` then put the SD card in the device and boot it up
  * When updating the firmware, the [Nerves Firmware SSH project](https://github.com/nerves-project/nerves_firmware_ssh) enables you to generate an upload script with `MIX_TARGET=rpi0 MIX_ENV=prod mix firmware.gen.script` and then upload it to a connected device with `MIX_TARGET=rpi0 MIX_ENV=prod ./upload.sh`
  * After the firmware is uploaded and the device (re)booted, you can access the UI at statusmotron.local.

## Future Goals
  * Integrations with various status tracking tools and other input methods
  * Expanded status definition capabilities and 
  * Tests, robustness enhancement, etc.
  * Broader, configurable hardware support
  
## Thanks / Acknowledgements
  * Thanks to [Joel Byler](https://github.com/joelbyler) for guidance, answering questions and pointing me to his own Nerves based lamp project from which this project draws some ideas
  * Shout out to the Elixir, Phoenix and Nerves communities for their awesome platforms and documentation
