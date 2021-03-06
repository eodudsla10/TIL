#def 함수명([argumentlist]) :
#   구현
#   [return data]
#함수는 정의 --> 함수호출
#함수 호출 시 정의된 함수의 arugmentlist에 맞도록 데이터 전달
# 가변 매개변수(*argument) 사용시 호출 시마다 argumentlist가 다를 수 있다. ex) def print_3_times(*value):
# 기본 매개변수(argument=값) argument 기본값 설정 - 호출시 argument 생략가능

#함수 정의
def print_3_times(value):
    for i in range(3):
        print("{0} : hello function {1}".format(i,value))

#함수 호출
print_3_times('test')

def argument_test(a, b=20, c=30):
    print("{0} : {1} : {2}".format(a,b,c,))

argument_test(10) #b,c는 기본값 : 10:20:30
argument_test(b=200, c=300, a=100) #순서상관없이 변수에 값 매핑 : 100;200:300
argument_test(1000,2000,3000)#순서대로 매핑 : 1000:2000:3000


def return_none_test():
    return      #return : function 종료 - 호출한 곳으로


print(return_none_test()) #return data 없을 경우 None



def return_test(a,b):
    sum = a+b
    return sum

print(return_test(10,20))


#전달되는 가변 매개변수 곱해서 리턴하기

def mul(*values):
    result=1
    for value in values:
        result *= value
    return result

print(mul(5,7,9,10))


#tuple : 값 변경하지 않는 list  tuple 변수 =(value, value, ....)
tuple_data =(10,20,30,40,50) #cf list_data=[10,20,30,40,50]
list_data=[10,20,30,40,50]

for tdata in tuple_data:
    print(tdata, end=" ")
print()
for ldata in list_data:
    print(ldata, end=" ")
print()
list_data[0]=100
# tuple_data[0]=100 //TypeError : 값을 변경할 수 없다 .
# tuple : function에서 다수의 데이터 리턴시 사용
def test_tuple():
    return(10,20)

a,b = test_tuple()
print("{0} + {1} + {2}".format(a,b,a+b) )

#람다 : lamda argumentlist:return   - 1회성 익명함수 ->1회성으로 사용할 때 굳이 함수로 정의하기 보단 간단하게 람다식으로 정의해서 사용
list_input =[1,2,3,4,5]
output_list = map(lambda data:data*data,list_input)
print(list_input)
print(output_list)
print(list(output_list))
output_filter = filter(lambda data: data<3, list_input)
print(list_input)
print(output_filter)
print(list(output_filter))