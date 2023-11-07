set -e
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

Files=`find -name "*.java"`
expected="ListExamples.java"
for file in $Files
do
    if [[ -f $file ]] && [[ $file == $expected ]]
    then 
        echo "Correct file found"
        exit
    fi 
done
cp student-submission/ListExamples.java grading-area
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
