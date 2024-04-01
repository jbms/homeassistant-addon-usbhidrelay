# USB HID Relay addon for home assistant

This addon exposes USB HID relay devices to Home Assistant via MQTT.

It is based on https://github.com/darrylb123/usbrelay with the following changes:

- Home Assistant addon build scripts and configuration added
- The `usbrelayd` program has been heavily modified (essentially
  rewritten) to support the Home Assistant MQTT discovery protocol and
  to use a new configuration protocol.
- The command-line usbrelay program was removed.
- The libusbrelay library is now statically linked into the Python
  extension module for simplicity, but it still depends on the system
  hiddev library.
