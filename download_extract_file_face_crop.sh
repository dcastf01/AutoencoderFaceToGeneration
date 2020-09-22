downloading () {
  curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}" > /dev/null
  curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=$1" -o $2

}
folderTarFile="Dataset"
folderDatasetFile=$folderTarFile"/UTKFace"
mkdir $folderTarFile
mkdir $folderDatasetFile
mkdir $folderTarFile"/Output"

fileid="0BxYys69jI14kYVM3aVhKS1VhRUk"
filename="part1.tar.gz"
downloading $fileid $filename
mv $filename $folderTarFile
tar -xf $folderTarFile"/"$filename -C $folderDatasetFile --strip-components 1
rm $folderTarFile"/"$filename

fileid="0BxYys69jI14kRjNmM0gyVWM2bHM"
filename="part2.tar.gz"
downloading $fileid $filename
mv $filename $folderTarFile
tar -xf $folderTarFile"/"$filename -C $folderDatasetFile --strip-components 1
rm $folderTarFile"/"$filename


