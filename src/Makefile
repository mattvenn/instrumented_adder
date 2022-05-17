all: sklansky.v

install_adder:
	pip3 install git+https://github.com/tdene/synth_opt_adders.git --user

sklansky.v:
	python3 -c 'from pptrees.adder_tree import adder_tree as tree; g = tree(8, network = "sklansky"); g.hdl("sklansky.v")'
