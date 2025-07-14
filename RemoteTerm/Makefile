.PHONY: build clean


J ?= $(shell nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 4)

build:
	@start_time=$$(date +%s); \
	echo "[QTermWidget] CMake构建..."; \
	mkdir -p qtermwidget/build && cd qtermwidget/build && (cmake .. && make -j$(J)) || { echo "[QTermWidget] 构建失败"; exit 1; }; \
	echo "[RemoteTerm] qmake构建..."; \
	cd ../.. && mkdir -p build && cd build && cmake .. && make -j$(J) || { echo "[RemoteTerm] 构建失败"; exit 1; }; \
	end_time=$$(date +%s); \
	elapsed=$$((end_time - start_time)); \
	echo "### [ALL] Build SUCCESSFUL, elapsed time: $${elapsed} s"

clean:
	rm -rf build
	rm -rf qtermwidget/build
