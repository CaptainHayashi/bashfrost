# Bashfrost

Bashfrost is a set of `bash` and `sh` scripts for controlling a Bifrost
server such as `playd`.  It uses `socat` to phone into the server.


## Warning

Bashfrost is not production-ready!  We know of the following issues:

* Bad escaping when escaping commands to `socat`, which could be a
  security risk;
* Little to no error handling;
* Lots of code duplication;
* Doesn't work if you try to use the scripts outside of their working
  directory.

That said, I use this and `playd` as a music player quite frequently.


## Scripts

The user-facing scripts are:

* `random.sh PATH`: sends random songs from `PATH` to the Bifrost
  player;
* `play.sh`, `stop.sh`, `end.sh` and `eject.sh`: send their respective
  commands to the Bifrost player.
* `sendcmd.sh`: sends one command to the Bifrost player.

All but `random.sh` work on any `sh`; `random.sh` needs `bash`.


## Environment variables

* `BIFROST`: a TCP `host:port` used to connect to the Bifrost server.`


## Licence

MIT: see `COPYING`.
