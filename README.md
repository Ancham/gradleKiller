# gradleKiller

There is a bug as i know on Ubuntu 20.04 and Fedora 33 that after some builds with gradle that processes are not killed so they are using ram endessly.
That simple bash script killing that processes on every [time is chosen by user]  

## Example of usage
```bash gradleKiller.sh 120 &``` On every 120 seconds script will be looking for processes. Don't set this time too low because it only checking if running processes are in sleeping state and kills them. So even if you have some active builds is may kill it.

