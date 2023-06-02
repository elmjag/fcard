all:
	mix release --overwrite fcards
	cp _build/dev/rel/bakeware/fcards .
