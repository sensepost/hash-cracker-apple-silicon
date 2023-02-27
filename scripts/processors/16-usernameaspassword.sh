#!/bin/bash
# Copyright crypt0rr

# Requirements
source scripts/selectors/hashtype.sh
source scripts/selectors/hashlist.sh

# Rules
source scripts/rules/rules.config
RULELIST=($big $fbfull $d3ad0ne $d3adhob0 $digits1 $digits2 $digits3 $dive $fordyv1 $generated2 $generated3 $hob064 $huge $leetspeak $NSAKEYv2 $ORTRTS $OUTD $pantag $passwordpro $rockyou30000 $techtrip2 $tenKrules $toggles1 $toggles2 $toprules2020 $TOXIC10k $TOXICSP $williamsuper)

# Cleanup
function clean_up {
    rm $tmp 2>/dev/null
    exit
}

trap clean_up SIGINT SIGTERM

# Temporary Files
tmp=$(mktemp /tmp/hash-cracker-tmp.XXXX)

# Logic
cat $HASHLIST | cut -d ':' -f1 | cut -d '\' -f2 > $tmp
$HASHCAT $KERNEL --bitmap-max=24 --potfile-path=$POTFILE -m$HASHTYPE $HASHLIST $tmp
for RULE in ${RULELIST[*]}; do
    $HASHCAT $KERNEL --bitmap-max=24 --potfile-path=$POTFILE -m$HASHTYPE $HASHLIST $tmp -r $RULE --loopback
done
rm $tmp; echo -e "\nUsername as Password processing with rules done\n"