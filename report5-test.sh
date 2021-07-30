#!/bin/bash

ans="/tmp/$$-ans"
result="/tmp/$$-result"
err="/tmp/$$-error"

#テスト1：正常動作の確認
echo "GCD of 750 and 507 is 3" > ${ans}
./report5.sh 750 507 > ${result}
diff ${ans} ${result} || echo "error in 1" >> ${err}

#テスト2：異常動作の確認
#テスト2-1：変数の数が2より小さい場合
echo "!ERROR!:Input two numbers with space in between." > ${ans}
./report5.sh      > ${result}
diff ${ans} ${result} || echo "error in 2-1" >> ${err}

#テスト2-2：変数が0より小さい場合
echo "!ERROR!:Input number which is greater than 0." > ${ans}
./report5.sh -1 -1 > ${result}

diff ${ans} ${result} || echo "error in 2-2" >> ${err}

#テスト2-3：変数が数字じゃない場合(小数$a)
echo "!ERROR!0.1 is not a number.Input an integer." > ${ans}
./report5.sh 0.1 22 > ${result}
diff ${ans} ${result} || echo "error in 2-3" >> ${err}

#テスト2-4：変数が数字じゃない場合(文字$a)
echo "!ERROR!a is not a number.Input an integer." > ${ans}
./report5.sh "a" 22 > ${result}
diff ${ans} ${result} || echo "error in 2-4" >> ${err}

#テスト2-5：変数が数字じゃない場合(小数$b)
echo "!ERROR!-0.1 is not a number.Input an integer." > ${ans}
./report5.sh 22 0.1 > ${result}
diff ${ans} ${result} || echo "error in 2-5" >> ${err}

#テスト2-6：変数が数字じゃない場合(文字$b)
echo "!ERROR!a is not a number.Input an integer." > ${ans}
./report5.sh 22 "a" > ${result}
diff ${ans} ${result} || echo "error in 2-6" >> ${err}

#if [ -f ${err} ];
#then
#	cat ${erro}
#	rm /tmp/$$-*
#	exit 1
#fi 

