downloading () {
  curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=$1" -o $2

}
folderTarFile="Dataset"
folderDatasetFile=$foldertarFile+"/UTKFace"
mkdir $folderTarFile
mkdir $folderDatasetFile

fileid="0BxYys69jI14kb2o4ajJwQ3FOUm8"
filename="part1.tar.gz"
downloading $fileid $filename
mv $filename $folderTarFile
tar -xf $folderTarFile"/"$filename -c $folderDatasetFile --strip-components 1
ls -la file.*


fileid="0BxYys69jI14kNEt1SnNJN1Z2WWc"
filename="part2.tar.gz"
downloading $fileid $filename

fileid="0BxYys69jI14kVkVTZHZHa21zUXM"
filename="part3.tar.gz"
downloading $fileid $filename

