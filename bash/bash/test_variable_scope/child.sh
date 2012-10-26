#!/bin/bash
#Note: changes to environ variables in a child process
# don't make it back to their parent.  Changes are local,
# and available to another level of child processes.
export status="bad"
exit 114
