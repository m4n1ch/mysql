#!/bin/bash
__run_supervisor() {
echo "Running the run_supervisor function."
supervisord -n
}
__run_supervisor

