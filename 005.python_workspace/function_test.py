#def 함수명([argumentlist]) :
#   구현
#   [return data]
#함수는 정의 --> 함수호출
#함수 호출 시 정의된 함수의 arugmentlist에 맞도록 데이터 전달

#함수 정의
def print_3_times(value):
    for i in range(3):
        print("{0} : hello function {1}".format(i,value))

#함수 호출
print_3_times('test')