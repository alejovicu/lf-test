# Required

* python & pip
* docker
* jq


# How to run the tests:

1. Setup project and start selenium server
   ```
   ./setup.sh

   or 

   ./setup.sh -d
   ```
   the `-d` option is to enable the vnc option to the selenium grid nodes. You can access them using a vnc client like TigerVNC Viewer in the host `localhost:5900` for chrome or `localhost:5901` for firefox. The password is `secret`

1. Run tests:
   ```
   ./run-tests.sh
   ```