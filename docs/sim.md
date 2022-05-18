# Wed 18 May 16:08:55 CEST 2022

Trying to simulate a [ring of inverters](../src/instrumented_adder.v). I don't think this can be done with the digital sim tools, so I am 
trying to use a spice file extracted from the GDS of the hardened verilog.

## Use OpenLane to build GDS

    make mount
    ./flow -design wrapped_instrumented_inverter

I added the complete run directory: runs/RUN_2022.05.18_14.08.09

## Check synth log

    cat runs/RUN_2022.05.18_14.08.09/reports/synthesis/1-synthesis.stat.rpt.strategy4

## Get non-blackboxed spice file

    cd runs/RUN_2022.05.18_14.08.09/results/final/gds
    ln -s ../../finishing/.magicrc # get a local copy of magicrc file to be able to open the gds with magic
    magic instrumented_adder.gds

Then in the magic command window type:

    extract
    ext2spice lvs
    ext2spice
    quit

Then you will have the full spice file. I've copied this to ./spice

## Try to simulate with spice

Check the commented spice/simulation.spice file. It provides power, clock and an initial reset.
The [simulation fails to converge](../spice/spice.log) and I never get to see the inverter loop oscillating.

    cd spice
    ngspice simulation.spice

If you want to run the simulation, change the PDK include line at the top of simulation.spice to match your local library install.
