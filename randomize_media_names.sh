# You can't shuffle media when creating new clip in iMovie.
# But you can randomize filenames in your media source folder.
# And then put it in your iMovie project to make slideshow with auto Ken Burns effect.

mkdir -p random # create folder to put files with new names to

for filename in *
do
   cp "$filename" ./random/"$(( $RANDOM % 1000 ))_$filename" # rename files in source folder by adding random number 0..1000 in 1st position
done
