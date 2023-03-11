#!/bin/bash
# Copyright crypt0rr

# Requirements
HASHCAT=$(command -v hashcat)
POTFILE=(hash-cracker.pot)

# Logic
if [[ -x "scripts/extensions/common-substr" ]]; then
    echo '[+] common-substr is executable'
else
    echo '[-] common-substr is not executable or found (option 10 / 11)'
fi
if [[ -x "scripts/extensions/hashcat-utils/bin/expander.bin" ]]; then
    echo '[+] expander is executable'
else
    echo '[-] expander is not available/executable or found, this is needed for fingerprint cracking'
fi
if [[ -x "scripts/extensions/cewl/cewl.rb" ]]; then
    echo '[+] CeWL is executable'
    CEWL="scripts/extensions/cewl/cewl.rb"
else
    echo '[-] CeWL is not executable or found (option 18)'
fi