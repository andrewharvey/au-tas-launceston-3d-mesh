all: atlas.json atlas.txt downloadTiles unzip gltf

atlas.json:
	wget http://s3-ap-southeast-2.amazonaws.com/launceston/atlas/atlas.json

atlas.txt: atlas.json
	./src/toList.js < $< > $@

downloadTiles: atlas.txt
	mkdir -p zip
	wget -i $< --no-clobber --directory-prefix=zip

unzip:
	./src/unzip.sh

gltf:
	./src/gltf.sh
