#compile -a hello.asm -o hello.o -e hello

# ld -o hello hello.o \                                  
#         -lSystem \
#         -syslibroot `xcrun -sdk macosx --show-sdk-path` \
#         -e _start \
#         -arch arm64

while getopts a:o:e: flag
do
    case "${flag}" in
        a) asmfile=${OPTARG};;
        o) object=${OPTARG};;
        e) executable=${OPTARG};;
    esac
done

# echo $asmfile
# echo $object
# echo $executable

as $asmfile -o $object
#ld -o $executable $object -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
ld -o $executable $object -lSystem \
        -syslibroot `xcrun -sdk macosx --show-sdk-path` \
        -e _start \
        -arch arm64