#!/bin/sh

mkdir -p gltf
for f in unzip/*.fbx; do
    echo $b
    b=`basename $f .fbx`
    rm -rf gltf_out
    FBX2glTF --draco --verbose --input $f --output gltf
    for t in gltf_out/*.dds; do
        tb=`basename $t .dds`
        convert $t gltf_out/$tb.webp
        rm $t
    done
    sed -i 's/\.dds"/\.webp"/g' gltf_out/gltf.gltf
    mv gltf_out gltf/$b
done
