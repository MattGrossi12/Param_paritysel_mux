# Nome do executável de simulação
SIM = sim.vvp
LD_LIBRARY_PATH="" gtkwave dump.fst
# Variáveis de Configuração
TOP_MODULE   = Param_paritysel_mux
TESTBENCH = testbench

# Lista de arquivos Verilog
VERILOG_FILES = \
    $(TOP_MODULE).v \
    $(TESTBENCH).sv

# Comando de compilação pelo cvc:
cvc:
	cvc64 +acc+2 +parallel2=on $(VERILOG_FILES)
	./cvcsim
	rm -f cvcsim

#+fstvars 
fst:
	./cvcsim
	rm -f cvcsim
# cvc64 +large $(VERILOG_FILES)
# cvc64 +large +fst+parallel2=on $(VERILOG_FILES)
# cvc64 +interp +fst+parallel2=on $(VERILOG_FILES)

# Comando de compilação pelo icarus:
icarus:
	iverilog -Wall -g2012 -o $(SIM) $(VERILOG_FILES)
	vvp $(SIM)
	rm -f sim.vvp

# Visualização com surfer:
surf:
	surfer dump.fst

# Visualização com GTK:
gtk:
	gtkwave dump.fst

# Síntese do diagrama
synth:
	yosys synth.ys

# Síntese do visualização
diagram:
	netlistsvg netlist.json -o diagram.svg

png:
	convert diagram.svg diagram.png

# Limpeza dos arquivos gerados
clean:
	rm -f dump.fst
	rm -f netlist.v
	rm -f netlist.json
	rm -f sim.vvp
	rm -f diagram.dot
	rm -f diagram.svg
	rm -f diagram.png
	rm -f cvcsim
	rm -f verilog.log
	clear