n ?= 2
guests ?= 5

run:
	@clingo facts.lp pricing.lp solution.lp 0 -c n=$(n) -c guests=$(guests)

