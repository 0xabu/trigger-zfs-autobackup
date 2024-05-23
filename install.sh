#!/usr/bin/env bash

# Installs or updates trigger-zfs-autobackup to a venv in the current working directory.
set -euo pipefail

VENV_PYTHON="$PWD/bin/python3"
if [[ ! -x "$VENV_PYTHON" ]]; then
    echo "Creating Python virtual environment..."
    # Create Python virtual environment (isolated from Python installation on TrueNAS SCALE)
    # Use --without-pip because ensurepip is not available.
    python3 -m venv --without-pip "$PWD"

    # Install pip inside virtual environment
    curl -fsSL https://bootstrap.pypa.io/get-pip.py | "$VENV_PYTHON"
fi

# Install inside the virtual environment
exec "$VENV_PYTHON" -m pip install git+https://github.com/0xabu/trigger-zfs-autobackup.git
