# 파이썬 실습
todo=[]

def register(todolist):
    index = is_exist(todolist["todoNum"])
    if index < 0:
        todo.append(todolist)
        return "{0}(이)가 등록되었습니다.".format(todolist["title"])
    else:
        return "이미 등록된 정보입니다."    #중복 등록 방지
        

def getAllStudents():
    return todo

def update(todoNum,title):
    index = is_exist(todoNum)
    if index >= 0 :
        todo[index]["title"] = title
        print("{0}의 정보가 수정되었습니다.".format(todoNum))
    else :
        print("{0}의 정보가 존재하지 않습니다.".format(todoNum))

def remove(todoNum):
    index = is_exist(todoNum)
    if index >=0:
        todo.pop(index)
        return "{0} 정보를 삭제했습니다.".format(todoNum)
    else:
        return "{0} 정보가 존재하지 않습니다.".format(todoNum)

def is_exist(todoNum):
    for index, todolist in enumerate(todo):
        if todolist["todoNum"] == todoNum:
            return index
    return -1           #0보다 작으면 없다라고 인식
    


def menu_display():
    print("===== todo =====")
    print("1. 일정 등록")
    print("2. 목록 보기")
    print("3. 일정 수정")
    print("4. 일정 삭제")
    print("0.종료")

def message_display(message):
    print(message)

while True:
    menu_display()

    menu =input("메뉴를 선택하세요 : ")
    if menu == "1":
        todoNum=input("번호 :")
        title =input("일정 : ")
        todolist = {"todoNum":todoNum, "title":title}

        message_display(register(todolist))

    elif menu == "2":
        print("=====목록 보기====")
        print(todo)

    elif menu == "3":
        todoNum = input("수정할 일정 번호")
        title = input("수정할 일정 내용 : ")

        message_display(update(todoNum,title))

    elif menu == "4":
        todoNum = input("삭제할 일정번호 :")

        message_display(remove(todoNum))
        

    elif menu == "0":
        message_display("실행을 종료합니다")
        break

    else :
        print()
        message_display("1,2,3,4,0 번 중 선택하세요" )



