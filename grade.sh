//set -e
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

Files=`find . -name "*.java"`
expected="ListExamples.java"
for file in $Files
do
    if [[ -f $file ]] && [[ $file == **/ListExamples.java* ]]
    then 
        echo "Correct file found"
        exit
    fi 
done
cp student-submission/ListExamples.java grading-area

cp -r lib grading-area

cd grading-area

javac -cp $CPATH *.java

if [[ $? != 0 ]]
then 
    echo compilation error
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test.txt

grep -oE run: [0-9]+ grading-area/test.txt > Tests.txt
numTests = grep -oE [0-9]+ Tests.txt

grep -oE Failures: [0-9]+ grading-area/test.txt > Failures.txt
numFail = grep -oE [0-9]+ Failures.txt

echo $numFail
$grade = $numFail/$numTests
echo $grade
grep "test" test.txt
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
