SC=scratchip-0.4.5-py3-none-any.whl
SC_BAT=scratchip_batteries-0.2.5-py3-none-any.whl
SC_URL=https://gitee.com/colin4124/chisel3-tutorial/releases/download/v0.1/scratchip-0.4.5-py3-none-any.whl
SC_BAT_A_URL=https://gitee.com/colin4124/chisel3-tutorial/releases/download/v0.1/$(SC_BAT)aa
SC_BAT_B_URL=https://gitee.com/colin4124/chisel3-tutorial/releases/download/v0.1/$(SC_BAT)ab

SC_SRC=builds/scratchip-0.4.5-py3-none-any.whl
SC_BAT_A_SRC=builds/$(SC_BAT)aa
SC_BAT_B_SRC=builds/$(SC_BAT)ab

$(SC_SRC):
	mkdir -p builds
	cd builds ; wget $(SC_URL)

$(SC_BAT_A_SRC):
	mkdir -p builds
	cd builds ; wget $(SC_BAT_A_URL)

$(SC_BAT_B_SRC):
	mkdir -p builds
	cd builds ; wget $(SC_BAT_B_URL)

prepare: $(SC_SRC) $(SC_BAT_A_SRC) $(SC_BAT_B_SRC)
	cd builds ; cat $(SC_BAT)aa $(SC_BAT)ab > $(SC_BAT)
	cd builds ; pip3 install --user $(SC_BAT)
	cd builds ; pip3 install --user $(SC)
